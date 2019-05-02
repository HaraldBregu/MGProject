// 
//  MGBrowserController.swift
//
//  Created by harald bregu on 11/03/2019.
//  Copyright © 2019 Dream Building Company. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation
import WebKit
import SnapKit
import FirebaseCore
import GoogleMobileAds


public class MGBrowserController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    public var delegate: MGBrowserControllerDelegate!
    public var dataSource: MGBrowserControllerDataSource?
    public var assets: MGBrowserAsset!
    
    var activityIndicatorView: UIActivityIndicatorView!
    var back: UIBarButtonItem!
    var forward: UIBarButtonItem!
    var reload: UIBarButtonItem!
    var spacer: UIBarButtonItem!
    var bannerView: GADBannerView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = assets.string.title
        navigationItem.title = assets.string.navigationTitle
        
        view.backgroundColor = assets.color.view
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.tintColor = assets.color.navigationBarContent
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        
        if let items = dataSource?.leftBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            navigationItem.leftBarButtonItems = items
            navigationItem.leftItemsSupplementBackButton = true
        }
        
        if let items = dataSource?.rightBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            navigationItem.rightBarButtonItems = items
        }

        let goBack = #selector(goBack(barButtonItem:))
        let goForward = #selector(goForward(barButtonItem:))
        let reloadPage = #selector(reload(barButtonItem:))

        spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        back = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: goBack)
        forward = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: goForward)
        reload = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: reloadPage)
        
        if let items = dataSource?.toolBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            items.forEach { item in
                switch item.accessibilityIdentifier {
                case "BACK":
                    back = item
                    back.target = self
                    back.action = goBack
                    break
                case "FORWARD":
                    forward = item
                    forward.target = self
                    forward.action = goForward
                    break
                case "RELOAD":
                    reload = item
                    reload.target = self
                    reload.action = reloadPage
                    break
                default:
                    break
                }
            }
        }
        
        toolbarItems = [back, spacer, reload, spacer, forward]
        navigationController?.setToolbarHidden(false, animated: false)
        navigationController?.toolbar.barTintColor = assets.color.toolBar
        navigationController?.toolbar.tintColor = assets.color.toolBarContent
        navigationController?.toolbar.isTranslucent = false
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        let url = URL(string: assets.data.url) ?? URL(string: "https://google.com/")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        
        back.isEnabled = webView.canGoBack
        forward.isEnabled = webView.canGoForward
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        view.addSubview(bannerView)
        if let assets = assets, assets.data.enableAds == true, assets.data.adsUnitId.count > 0 {
            bannerView.snp.makeConstraints { make in
                make.bottom.equalTo(self.view)
                make.leading.equalTo(self.view)
                make.trailing.equalTo(self.view)
            }
            bannerView.adUnitID = assets.data.adsUnitId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        }
    }
    
    @objc private func navigationItemAction(barButtonItem: UIBarButtonItem) {
        self.delegate?.controller(self, didTapBarButtonItem: barButtonItem)
    }

    @objc private func goBack(barButtonItem: UIBarButtonItem) {
        back.isEnabled = webView.canGoBack
        webView.goBack()
    }
    
    @objc private func goForward(barButtonItem: UIBarButtonItem) {
        forward.isEnabled = webView.canGoForward
        webView.goForward()
    }
    
    @objc private func reload(barButtonItem: UIBarButtonItem) {
        webView.reload()
    }
}

extension MGBrowserController: WKNavigationDelegate {

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        back.isEnabled = webView.canGoBack
        forward.isEnabled = webView.canGoForward
        activityIndicatorView.stopAnimating()
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        back.isEnabled = webView.canGoBack
        forward.isEnabled = webView.canGoForward
        decisionHandler(WKNavigationActionPolicy.allow)
    }

    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        back.isEnabled = webView.canGoBack
        forward.isEnabled = webView.canGoForward
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    
}

extension MGBrowserController {

    public static var instance: MGBrowserController {
        let podBundle = Bundle(for: MGBrowserController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGBrowserController else {
            return MGBrowserController()
        }
        return controller
    }

}

fileprivate let storyboardName          = "MGBrowser"
fileprivate let controllerIdentifier    = "MGBrowserController"
fileprivate let resourceName            = "MGBrowserKit"
fileprivate let resourceExtension       = "bundle"

extension MGBrowserController: GADBannerViewDelegate {
    
    /// Tells the delegate an ad request loaded an ad.
    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        //print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    public func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        //print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    public func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        //print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    public func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        //print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    public func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        //print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    public func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        //print("adViewWillLeaveApplication")
    }
    
}

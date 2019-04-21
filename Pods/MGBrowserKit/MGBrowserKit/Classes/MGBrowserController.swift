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


public class MGBrowserController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    public var delegate:MGBrowserControllerDelegate!
    public var dataSource:MGBrowserControllerDataSource?
    public var data:MGBrowser!
    public var asset:MGBrowserAsset!

    
    var activityIndicatorView:UIActivityIndicatorView!
    var back:UIBarButtonItem!
    var forward:UIBarButtonItem!
    var reload:UIBarButtonItem!
    var spacer:UIBarButtonItem!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = asset.string.title
        navigationItem.title = asset.string.title
        
        view.backgroundColor = asset.color.backgroundView
        navigationController?.navigationBar.tintColor = asset.color.navigationBarTint
        navigationController?.navigationBar.barTintColor = asset.color.navigationBar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        
        if let items = dataSource?.leftBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemMenuAction(barButtonItem:)) })
            navigationItem.leftBarButtonItems = items
        }
        
        let goBack = #selector(goBack(barButtonItem:))
        let goForward = #selector(goForward(barButtonItem:))
        let reloadPage = #selector(reload(barButtonItem:))

        spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        back = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: goBack)
        forward = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: goForward)
        reload = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: reloadPage)
        
        if let items = dataSource?.toolBarButtonItems(self) {
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
        navigationController?.toolbar.tintColor = asset.color.toolBarTint
        navigationController?.toolbar.barTintColor = asset.color.toolBar
        navigationController?.toolbar.isTranslucent = false
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        let url = URL(string: data.url) ?? URL(string: "https://google.com/")!
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        activityIndicatorView = UIActivityIndicatorView(style: .gray)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        
        back.isEnabled = webView.canGoBack
        forward.isEnabled = webView.canGoForward
    }
    
    @objc private func navigationItemMenuAction(barButtonItem: UIBarButtonItem) {
        self.delegate.browserController(self, didTapBarButtonItem: barButtonItem)
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

    public static var controller: MGBrowserController {
        let podBundle = Bundle(for: MGBrowserController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGBrowserController else {
            return MGBrowserController()
        }
        return controller
    }
    
    public static func controller(asset: MGBrowserAsset) -> MGBrowserController {
        let podBundle = Bundle(for: MGBrowserController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGBrowserController else {
            return MGBrowserController()
        }
        controller.asset = asset
        return controller
    }

}

fileprivate let storyboardName          = "MGBrowser"
fileprivate let controllerIdentifier    = "MGBrowserController"
fileprivate let resourceName            = "MGBrowserKit"
fileprivate let resourceExtension       = "bundle"

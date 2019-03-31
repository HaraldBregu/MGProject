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
    var data:MGBrowserData!
    var design:MGBrowserDesign!
    public var delegate:MGBrowserControllerDelegate!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = data.title
        navigationItem.title = data.title
        view.backgroundColor = design.viewBackgroundColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = design.navigationBarBackgroundColor
        navigationController?.navigationBar.tintColor = design.navigationBarTintColor
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: design.leftBarButtonImage, style: .plain, target: self, action: #selector(revealMenuViewcontroller))
        
        activityIndicatorView.style = .white
        activityIndicatorView.center = webView.center
        
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.isOpaque = false
        webView.backgroundColor = design.viewBackgroundColor
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let websiteUrl = URL(string: data.urlString) ?? URL(string: "https://google.com/")!
        let urlRequest = URLRequest(url: websiteUrl)
        webView.load(urlRequest)
        startActivityIndicatorView()
    }
    
    private lazy var activityIndicatorView:UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        activityIndicatorView.center = view.center
        return activityIndicatorView
    }()
    
    private func startActivityIndicatorView() {
        webView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }

    private func stopActivityIndicatorView() {
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }
    
    @objc private func revealMenuViewcontroller() {
        delegate.didTapLeftBarButtonItem(controller: self)
    }

}

/// :nodoc:
extension MGBrowserController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        stopActivityIndicatorView()
    }
}

public protocol MGBrowserControllerDelegate {
    func didTapLeftBarButtonItem(controller: MGBrowserController)
}

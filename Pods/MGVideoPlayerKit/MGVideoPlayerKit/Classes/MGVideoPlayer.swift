// 
//  MGVideoPlayer.swift
//
//  Created by harald bregu on 16/03/2019.
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

public class MGVideoPlayer {
    public var containerController: UINavigationController!
    
    public init() {
        controller = _controller
        containerController = UINavigationController(rootViewController: controller)
    }
    
    public var dataSource: MGVideoPlayerDataSource! {
        didSet {
            controller.data = dataSource.data
            controller.items = dataSource.items
            controller.layout = dataSource.layout
        }
    }
    
    public var delegate: MGVideoPlayerDelegate! {
        didSet {
            controller.didTapNavigationItem = { [unowned self] (controller, barButtonItem) in
                self.delegate.videoPlayerController(controller, didTapMenuNavigationItem: barButtonItem)
            }
        }
    }
    
    private var controller: MGVideoPlayerListController!
}

extension MGVideoPlayer {
    
    private var _controller: MGVideoPlayerListController {
        guard let controller = _storyboard.instantiateViewController(withIdentifier: listControllerIdentifier) as? MGVideoPlayerListController else { return MGVideoPlayerListController() }
        return controller
    }
    
    private var _storyboard:UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: _storyboardBundle)
    }
    
    private var _storyboardBundle:Bundle {
        let podBundle = Bundle(for: MGVideoPlayer.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!)!
        return bundle
    }
    
}

fileprivate let storyboardName = "MGVideoPlayer"
fileprivate let listControllerIdentifier = "MGVideoPlayerListController"
fileprivate let controllerIdentifier = "MGVideoPlayerController"
fileprivate let resourceName = "MGVideoPlayerKit"
fileprivate let resourceExtension = "bundle"

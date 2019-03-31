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
    
    public init(dataList: [MGVideoPlayerData]) {
        self.dataList = dataList
        self.listController = _listController
        self.listController.videoDataList = dataList
    }
    
    public var dataList: [MGVideoPlayerData]!
    public var listController: MGVideoPlayerListController!
    public var controller: MGVideoPlayerController!
}

extension MGVideoPlayer {
    
    private var _listController: MGVideoPlayerListController {
        guard let controller = _listViewController else { return MGVideoPlayerListController() }
        return controller
    }
    
    private var _listViewController: MGVideoPlayerListController? {
        return _storyboard.instantiateViewController(withIdentifier: listControllerIdentifier) as? MGVideoPlayerListController
    }
    
    private var _controller: MGVideoPlayerController {
        guard let controller = _viewController else { return MGVideoPlayerController() }
        return controller
    }
    
    private var _viewController: MGVideoPlayerController? {
        return _storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGVideoPlayerController
    }
    
    private var _storyboard:UIStoryboard {
        return UIStoryboard(name: _storyboardName, bundle: _storyboardBundle)
    }
    
    private var _storyboardName:String {
        return storyboardName
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

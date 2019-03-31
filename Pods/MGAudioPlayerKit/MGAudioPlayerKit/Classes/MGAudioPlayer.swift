// 
//  MGAudioPlayer.swift
//
//  Created by harald bregu on 30/03/2019.
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

public class MGAudioPlayer {
    
    public init() {
        listController = _listController
    }
    
    public var listController:MGAudioPlayerListController!
//    private var dataSource: MGLandingDataSource!
//    private var delegate: MGLandingDelegate!
}

extension MGAudioPlayer {
    
    private var _listController: MGAudioPlayerListController {
        guard let controller = _storyboard.instantiateViewController(withIdentifier: listControllerIdentifier) as? MGAudioPlayerListController
            else { return MGAudioPlayerListController() }
        return controller
    }
    
    private var _controller: MGAudioPlayerController {
        guard let controller = _storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGAudioPlayerController
            else { return MGAudioPlayerController() }
        return controller
    }
    
    private var _storyboard:UIStoryboard {
        return UIStoryboard(name: _storyboardName, bundle: _storyboardBundle)
    }
    
    private var _storyboardName:String {
        return storyboardName
    }
    
    private var _storyboardBundle:Bundle {
        let podBundle = Bundle(for: MGAudioPlayer.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!)!
        return bundle
    }
    
}

fileprivate let storyboardName = "MGAudioPlayer"
fileprivate let listControllerIdentifier = "MGAudioPlayerListController"
fileprivate let controllerIdentifier = "MGAudioPlayerController"
fileprivate let resourceName = "MGAudioPlayerKit"
fileprivate let resourceExtension = "bundle"

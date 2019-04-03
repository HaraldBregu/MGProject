// 
//  MGLanding.swift
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

public class MGLanding {
    
    public init(dataSource: MGLandingDataSource, delegate: MGLandingDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.controller = _controller
    }
    
    public var controller:MGLandingController!
    private var dataSource: MGLandingDataSource!
    private var delegate: MGLandingDelegate!
    
}

extension MGLanding {
    
    private var _controller: MGLandingController {
        guard let controller = _storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGLandingController
            else { return MGLandingController() }
        
        controller.data = dataSource.data
        controller.items = dataSource.items
        controller.layout = dataSource.layout
        
        return controller
    }
    
    private var _storyboard:UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: _storyboardBundle)
    }
        
    private var _storyboardBundle:Bundle {
        let podBundle = Bundle(for: MGLanding.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!)!
        return bundle
    }
    
}

fileprivate let storyboardName = "MGLanding"
fileprivate let controllerIdentifier = "MGLandingController"
fileprivate let resourceName = "MGLandingKit"
fileprivate let resourceExtension = "bundle"

// 
//  BrowserComponent.swift
//
//  Created by harald bregu on 28/04/2019.
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
import FirebaseRemoteConfig
import MGTemplateKit
import MGBrowserKit

protocol BrowserComponent {
    static var data: MGBrowserAsset { get }
}

extension BrowserComponent {
    
    static var data: MGBrowserAsset {
        
        return BrowserAsset(
            string: BrowserString(
                title: "My Website",
                navigationTitle: "My Website"),
            font: BrowserFont(),
            image: BrowserImage(),
            color: BrowserColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.primary,
                toolBar: MGTemplate.color.toolBar,
                toolBarContent: MGTemplate.color.text.primary,
                view: MGTemplate.color.view,
                viewContent: MGTemplate.color.text.primary),
            data: BrowserData(
                url: "https://thenextweb.com/",
                enableAds: RemoteConfig.remoteConfig()["enable_admob_banner"].boolValue,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716"))
    }
    
}

struct BrowserAsset: MGBrowserAsset {
    var string: MGBrowserString
    var font: MGBrowserFont
    var image: MGBrowserImage
    var color: MGBrowserColor
    var data: MGBrowserData
}

struct BrowserFont: MGBrowserFont {}

struct BrowserImage: MGBrowserImage {}

struct BrowserColor: MGBrowserColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
}

struct BrowserString: MGBrowserString {
    var title: String
    var navigationTitle: String
}

struct BrowserData: MGBrowserData {
    var url: String
    var enableAds: Bool
    var adsUnitId: String
}

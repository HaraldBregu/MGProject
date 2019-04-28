// 
//  MGBrowserAssetData.swift
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
import MGTemplateKit
import MGBrowserKit

protocol MGBrowserAssetData {
    static var setup: MGBrowserAsset { get }
}

extension MGBrowserAssetData {
    
    static var setup: MGBrowserAsset {
        
        return BrowserAsset(
            string: BrowserString(
                title: "The Next Web",
                navigationTitle: "The Next Web"),
            font: BrowserFont(),
            image: BrowserImage(),
            color: BrowserColor(
                backgroundView: MGTemplate.View.backgroundColor,
                navigationBar: MGTemplate.NavigationBar.backgroundColor,
                navigationBarTint: .white,
                toolBar: MGTemplate.NavigationBar.backgroundColor,
                toolBarTint: .white),
            data: BrowserData(
                url: "https://thenextweb.com/",
                enableAds: true,
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

struct BrowserFont: MGBrowserFont {
    
}

struct BrowserImage: MGBrowserImage {
    
}

struct BrowserColor: MGBrowserColor {
    var backgroundView: UIColor
    var navigationBar: UIColor
    var navigationBarTint: UIColor
    var toolBar: UIColor
    var toolBarTint: UIColor
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

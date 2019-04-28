// 
//  MGFeedAssetData.swift
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
import MGFeedKit

protocol MGFeedAssetData {
    static var setup: FeedAsset { get }
}

extension MGFeedAssetData {
    
    static var setup: FeedAsset {
        
        return FeedAsset(
            string: FeedString(
                title: "",
                navigationTitle: "",
                searchBarPlaceholder: "Search"),
            font: FeedFont(
                navigationTitle: nil,
                cellTitle: nil,
                cellDate: nil,
                cellDescription: nil),
            image: FeedImage(
                navigationItemMenu: UIImage(),
                navigationItemShare: UIImage(icon: .fontAwesomeSolid(.share), size: CGSize(width: 36, height: 36), textColor: .black)),
            color: FeedColor(
                navigationBar: MGTemplate.NavigationBar.backgroundColor,
                navigationBarTint: .white,
                toolBar: MGTemplate.NavigationBar.backgroundColor,
                toolBarTint: .white,
                backgroundView: MGTemplate.View.backgroundColor,
                backgroundTableView: MGTemplate.View.backgroundColor,
                tableViewSeparator: MGTemplate.View.backgroundColor,
                refreshTint: .white,
                searchBarTint: .white,
                backgroundViewCell: MGTemplate.View.backgroundColor,
                cellTint: .white),
            data: FeedData(
                url: "",
                enableAds: true,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716",
                darkKeyboard: true))
    }
}

struct FeedAsset: MGFeedAsset {
    var string: MGFeedString
    var font: MGFeedFont
    var image: MGFeedImage
    var color: MGFeedColor
    var data: MGFeedData
}

struct FeedString: MGFeedString {
    var title: String
    var navigationTitle: String
    var searchBarPlaceholder: String
}

struct FeedFont: MGFeedFont {
    var navigationTitle: UIFont?
    var cellTitle: UIFont?
    var cellDate: UIFont?
    var cellDescription: UIFont?
}

struct FeedImage: MGFeedImage {
    var navigationItemMenu: UIImage
    var navigationItemShare: UIImage
}

struct FeedColor: MGFeedColor {
    var navigationBar: UIColor
    var navigationBarTint: UIColor
    var toolBar: UIColor
    var toolBarTint: UIColor
    var backgroundView: UIColor
    var backgroundTableView: UIColor
    var tableViewSeparator: UIColor
    var refreshTint: UIColor
    var searchBarTint: UIColor
    var backgroundViewCell: UIColor
    var cellTint: UIColor
}

struct FeedData: MGFeedData {
    var url: String
    var enableAds: Bool
    var adsUnitId: String
    var darkKeyboard: Bool
}


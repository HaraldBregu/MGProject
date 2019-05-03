// 
//  FeedComponent.swift
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

protocol FeedComponent {
    static var data: FeedAsset { get }
}

extension FeedComponent {
    
    static var data: FeedAsset {
        
        return FeedAsset(
            string: FeedString(
                title: "",
                navigationTitle: "",
                searchBarPlaceholder: "Search"),
            font: FeedFont(
                tableViewCellTitle: MGTemplate.font.title3,
                tableViewCellSubtitle: MGTemplate.font.caption1,
                tableViewCellDescription: MGTemplate.font.body),
            image: FeedImage(),
            color: FeedColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.primary,
                refreshControl: MGTemplate.color.text.primary,
                searchBar: MGTemplate.color.searchBar,
                searchBarContent: MGTemplate.color.text.primary,
                toolBar: MGTemplate.color.toolBar,
                toolBarContent: MGTemplate.color.text.primary,
                view: MGTemplate.color.view,
                viewContent: MGTemplate.color.text.primary,
                tableView: MGTemplate.color.tableView,
                tableViewContent: MGTemplate.color.text.primary,
                tableViewSeparator: MGTemplate.color.tableViewSeparator,
                tableViewCell: MGTemplate.color.tableViewCell,
                tableViewCellContent: MGTemplate.color.text.primary,
                collectionView: MGTemplate.color.collectionView,
                collectionViewContent: MGTemplate.color.text.primary,
                tableViewCellTitle: MGTemplate.color.text.primary,
                tableViewCellSubtitle: MGTemplate.color.text.secondary,
                tableViewCellDescription: MGTemplate.color.text.primary),
            data: FeedData(
                url: "",
                enableAds: false,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716",
                keyboardAppearance: .dark,
                activityIndicatorStyle: .white))
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
    var tableViewCellTitle: UIFont?
    var tableViewCellSubtitle: UIFont?
    var tableViewCellDescription: UIFont?
}

struct FeedImage: MGFeedImage {
}

struct FeedColor: MGFeedColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var refreshControl: UIColor
    var searchBar: UIColor
    var searchBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var tableView: UIColor
    var tableViewContent: UIColor
    var tableViewSeparator: UIColor
    var tableViewCell: UIColor
    var tableViewCellContent: UIColor
    var collectionView: UIColor
    var collectionViewContent: UIColor
    var tableViewCellTitle: UIColor
    var tableViewCellSubtitle: UIColor
    var tableViewCellDescription: UIColor
}

struct FeedData: MGFeedData {
    var url: String
    var enableAds: Bool
    var adsUnitId: String
    var keyboardAppearance: UIKeyboardAppearance
    var activityIndicatorStyle: UIActivityIndicatorView.Style
}

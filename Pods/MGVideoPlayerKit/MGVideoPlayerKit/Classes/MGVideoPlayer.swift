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

public protocol MGVideoPlayerAsset {
    var string: MGVideoPlayerString { get set }
    var font: MGVideoPlayerFont { get set }
    var image: MGVideoPlayerImage { get set }
    var color: MGVideoPlayerColor { get set }
    var data: MGVideoPlayerData { get set }
}

public protocol MGVideoPlayerString {
    var title:String { get set }
    var navigationBarTitle: String { get set }
    var detailTitle: String { get set }
    var detailNavigationBarTitle: String { get set }
    var searchBarPlaceholder: String { get set }
    var navigationListPlayerPrompt: String? { get set }
    var navigationVideoPlayerPrompt: String? { get set }
    var detailTopCastTitle: String { get set }
}

public protocol MGVideoPlayerFont {
    var tableViewCellTitle: UIFont? { get set }
    var tableViewCellSubtitle: UIFont? { get set }
    var tableViewCellRating: UIFont? { get set }
    var tableViewCellDescription: UIFont? { get set }
    var detailTitle: UIFont? { get set }
    var detailSubtitle: UIFont? { get set }
    var detailRating: UIFont? { get set }
    var detailDescription: UIFont? { get set }
    var detailTopCastTitle: UIFont? { get set }
    var actorListFullname: UIFont? { get set }
    var actorListRolename: UIFont? { get set }
}

public protocol MGVideoPlayerImage {
    var likeNormal: UIImage { get set }
    var likeSelected: UIImage { get set }
    var likeHighlighted: UIImage { get set }
}

public protocol MGVideoPlayerColor {
    var navigationBar: UIColor { get set }
    var navigationBarContent: UIColor { get set }
    var toolBar: UIColor { get set }
    var toolBarContent: UIColor { get set }
    var view: UIColor { get set }
    var viewContent: UIColor { get set }
    var refreshControl: UIColor { get set }
    var activityIndicator: UIColor { get set }
    var tableView: UIColor { get set }
    var tableViewSeparator: UIColor { get set }
    var searchBarContent: UIColor { get set }
    var tableViewCell: UIColor { get set }
    var tableViewCellContent: UIColor { get set }
    var collectionView: UIColor { get set }
    var collectionViewContent: UIColor { get set }
    var tableViewCellTitle: UIColor { get set }
    var tableViewCellSubtitle: UIColor { get set }
    var tableViewCellRating: UIColor { get set }
    var tableViewCellDescription: UIColor { get set }
    var detailTopCastTitle: UIColor { get set }
}

public protocol MGVideoPlayerData {
    var items: [MGVideoPlayerItem]? { get set }
    var keyboardAppearance: UIKeyboardAppearance { get set }
    var statusBarStyle: UIStatusBarStyle { get set }
    var enableAds: Bool { get set }
    var adsUnitId: String { get set }
    var listRatingStarSize: Double { get set }
    var playerRatingStarSize: Double { get set }
}

public class MGVideoPlayerItem {
    public var title: String!
    public var description: String!
    public var pubYear: String!
    public var category: String!
    public var url: URL!
    public var thumbUrl: URL!
    public var starCount: Double!
    public var reviewCount: Int!
    public var actors: [MGVideoPlayerActorItem]!
    public init() {}
}

public class MGVideoPlayerActorItem {
    public var name: String!
    public var roleName: String!
    public var pictureUrl: String!
    public init(name: String, roleName: String, pictureUrl: String) {
        self.name = name
        self.roleName = roleName
        self.pictureUrl = pictureUrl
    }
}

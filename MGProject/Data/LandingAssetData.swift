// 
//  LandingAssetData.swift
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
import MGLandingKit

protocol LandingAssetData {
    static var setup: LandingAssets { get }
}

extension LandingAssetData {
    static var setup: LandingAssets {
        
        let isiPad = UIDevice.current.userInterfaceIdiom == .pad
        
        var megaitems = [MGLandingItemData]()
        var itemFeed = MGLandingItemData()
        itemFeed.title = "Feed Parser"
        itemFeed.thumbUrl = "https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/Latest-News.jpg?alt=media&token=fb163c62-cc01-4826-8482-b240877df839"
        megaitems.append(itemFeed)
        
        var item2 = MGLandingItemData()
        item2.title = "Video Player"
        item2.thumbUrl = "https://myfacemood.com/wp-content/uploads/2016/12/BitTorrent-Video-Streaming-per-iPhone.png"
        megaitems.append(item2)
        
        var item4 = MGLandingItemData()
        item4.title = "Audio Player"
        item4.thumbUrl = "https://www.apple.com/v/apple-music/i/images/shared/og_image.png"
        megaitems.append(item4)
        
        var itemWeb = MGLandingItemData()
        itemWeb.title = "Browser Web"
        itemWeb.thumbUrl = "https://clarivate.com/wp-content/uploads/2017/05/antifraud-darkweb-and-cyber-intelligence-560x320.jpg"
        megaitems.append(itemWeb)
        
        var itemone = MGLandingItemData()
        itemone.title = "Map View"
        itemone.thumbUrl = "https://snazzy-maps-cdn.azureedge.net/assets/37-lunar-landscape.png?v=20170626074350"
        megaitems.append(itemone)
        
        var itemSett = MGLandingItemData()
        itemSett.title = "Settings"
        itemSett.thumbUrl = "https://cdn.redmondpie.com/wp-content/uploads/2017/12/ios-12-dark-mode.png"
        megaitems.append(itemSett)
        
        return LandingAssets(
            string: LandingString(
                title: "",
                navigationTitle: "",
                contentTitle: "Multipurpose Universal iOS Template Framework",
                contentSubtitle: "MegaGeneral is a scalable multipurpose component based iOS framework. You can start develop many awesome apps from MegaGeneral framework. You can use a big sets of icons, fonts, and change dark theme with your personal custom theme.",
                contentUsername: "MegaTeamBuilder",
                contentHeadline: "Think fast, do the right.",
                contentCollectionTitle: "Integrated kits"),
            font: LandingFont(
                contentTitle: (isiPad ? MGTemplate.Font(size: 65).medium : MGTemplate.Font(size: 35).medium),
                contentSubtitle: (isiPad ? MGTemplate.Font(size: 32).light : MGTemplate.Font(size: 20).light),
                contentUsername: (isiPad ? MGTemplate.Font(size: 28).medium : MGTemplate.Font(size: 18).medium),
                contentHeadline: (isiPad ? MGTemplate.Font(size: 22).regular : MGTemplate.Font(size: 16).regular),
                contentCollectionTitle: (isiPad ? MGTemplate.Font(size: 22).regular : MGTemplate.Font(size: 16).regular),
                collectionViewCellTitle: (isiPad ? MGTemplate.Font(size: 32).light : MGTemplate.Font(size: 20).light)),
            image: LandingImage(
                userRightImage: UIImage(icon: .fontAwesomeSolid(.heart), size: CGSize(width: 36, height: 36), textColor: .black)),
            color: LandingColor(
                navigationBar: MGTemplate.assets.color.navigationBar,
                navigationBarContent: MGTemplate.assets.color.text.navigationBar,
                toolBar: MGTemplate.assets.color.toolBar,
                toolBarContent: MGTemplate.assets.color.text.toolBar,
                view: MGTemplate.assets.color.view,
                viewContent: MGTemplate.assets.color.text.primary,
                collectionView: MGTemplate.assets.color.collectionView,
                collectionViewCell: MGTemplate.assets.color.collectionViewCell,
                collectionViewCellContent: MGTemplate.assets.color.text.primary,
                collectionViewCellTitle: MGTemplate.assets.color.text.primary),
            data: LandingData(
                userImageUrl: URL(string:"https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/MGIconLight.png?alt=media&token=b8bb255f-7ede-4b54-a8c0-b3a63ad661f6")!,
                collectionItems: megaitems,
                enableAds: true,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716",
                statusBarStyle: .default,
                imageViewIndicatorStyle: .white))
    }
}

struct LandingAssets:MGLandingAsset {
    var string: MGLandingString
    var font: MGLandingFont
    var image: MGLandingImage
    var color: MGLandingColor
    var data: MGLandingData
}

struct LandingString:MGLandingString {
    var title: String
    var navigationTitle: String
    var contentTitle: String
    var contentSubtitle: String
    var contentUsername: String
    var contentHeadline: String
    var contentCollectionTitle: String
}

struct LandingFont:MGLandingFont {
    var contentTitle: UIFont?
    var contentSubtitle: UIFont?
    var contentUsername: UIFont?
    var contentHeadline: UIFont?
    var contentCollectionTitle: UIFont?
    var collectionViewCellTitle: UIFont?
}

struct LandingImage:MGLandingImage {
    var userRightImage: UIImage
}

struct LandingColor:MGLandingColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var collectionView: UIColor
    var collectionViewCell: UIColor
    var collectionViewCellContent: UIColor
    var collectionViewCellTitle: UIColor
}

struct LandingData:MGLandingData {
    var userImageUrl: URL
    var collectionItems: [MGLandingItemData]
    var enableAds: Bool
    var adsUnitId: String
    var statusBarStyle: UIStatusBarStyle
    var imageViewIndicatorStyle: UIActivityIndicatorView.Style
}


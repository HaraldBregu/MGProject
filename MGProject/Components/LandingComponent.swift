// 
//  LandingComponent.swift
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
import MGLandingKit

protocol LandingComponent {
    static var data: Landingasset { get }
}

extension LandingComponent {
    
    static var data: Landingasset {
        
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
        itemone.thumbUrl = "https://snazzy-maps-cdn.azureedge.net/asset/37-lunar-landscape.png?v=20170626074350"
        megaitems.append(itemone)
        
        var itemSett = MGLandingItemData()
        itemSett.title = "Settings"
        itemSett.thumbUrl = "https://cdn.redmondpie.com/wp-content/uploads/2017/12/ios-12-dark-mode.png"
        megaitems.append(itemSett)
        
        let ipad = (UIDevice.current.userInterfaceIdiom == .pad)
        let heartSize = ipad ? CGSize(width: 36, height: 36) : CGSize(width: 20, height: 20)
        
        return Landingasset(
            string: LandingString(
                title: "",
                navigationTitle: "",
                contentTitle: "Multipurpose Universal iOS Template Framework",
                contentSubtitle: "A scalable multipurpose component based iOS framework.",
                contentDescription: "MegaGeneral is a scalable multipurpose component based iOS framework. You can start develop many awesome apps from MegaGeneral framework. You can use a big sets of icons, fonts, and change dark theme with your personal custom theme.",
                contentUsername: "MegaGeneral Team",
                contentHeadline: "Think fast, do the right.",
                contentCollectionTitle: "Integrated kits"),
            font: LandingFont(
                contentTitle: MGTemplate.font.largeTitle,
                contentSubtitle: MGTemplate.font.callout,
                contentDescription: MGTemplate.font.body,
                contentUsername: MGTemplate.font.headline,
                contentHeadline: MGTemplate.font.footnote,
                contentCollectionTitle: MGTemplate.font.title3,
                collectionViewCellTitle: MGTemplate.font.caption1),
            image: LandingImage(
                userRightImage: UIImage(icon: .fontAwesomeSolid(.heart), size: heartSize, textColor: .red)),
            color: LandingColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.navigationBar,
                toolBar: MGTemplate.color.toolBar,
                toolBarContent: MGTemplate.color.text.toolBar,
                view: MGTemplate.color.view,
                viewContent: MGTemplate.color.text.primary,
                title: MGTemplate.color.text.primary,
                subtitle: MGTemplate.color.text.primary,
                description: MGTemplate.color.text.primary,
                collectionView: MGTemplate.color.collectionView,
                collectionViewCell: MGTemplate.color.collectionViewCell,
                collectionViewCellContent: MGTemplate.color.text.primary,
                collectionViewCellTitle: MGTemplate.color.text.primary),
            data: LandingData(
                userImageUrl: URL(string:"https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/MGIconLight.png?alt=media&token=b8bb255f-7ede-4b54-a8c0-b3a63ad661f6")!,
                collectionItems: megaitems,
                enableAds: RemoteConfig.remoteConfig()["enable_admob_banner"].boolValue,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716",
                statusBarStyle: .default,
                imageViewIndicatorStyle: .white))
    }
}

struct Landingasset: MGLandingAsset {
    var string: MGLandingString
    var font: MGLandingFont
    var image: MGLandingImage
    var color: MGLandingColor
    var data: MGLandingData
}

struct LandingString: MGLandingString {
    var title: String
    var navigationTitle: String
    var contentTitle: String
    var contentSubtitle: String
    var contentDescription: String
    var contentUsername: String
    var contentHeadline: String
    var contentCollectionTitle: String
}

struct LandingFont: MGLandingFont {
    var contentTitle: UIFont?
    var contentSubtitle: UIFont?
    var contentDescription: UIFont?
    var contentUsername: UIFont?
    var contentHeadline: UIFont?
    var contentCollectionTitle: UIFont?
    var collectionViewCellTitle: UIFont?
}

struct LandingImage: MGLandingImage {
    var userRightImage: UIImage
}

struct LandingColor: MGLandingColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var title: UIColor
    var subtitle: UIColor
    var description: UIColor
    var collectionView: UIColor
    var collectionViewCell: UIColor
    var collectionViewCellContent: UIColor
    var collectionViewCellTitle: UIColor
}

struct LandingData: MGLandingData {
    var userImageUrl: URL
    var collectionItems: [MGLandingItemData]
    var enableAds: Bool
    var adsUnitId: String
    var statusBarStyle: UIStatusBarStyle
    var imageViewIndicatorStyle: UIActivityIndicatorView.Style
}


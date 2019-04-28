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
        itemFeed.title = "mg.megageneral.componentcollection.item.one".localized
        itemFeed.thumbUrl = "https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/Latest-News.jpg?alt=media&token=fb163c62-cc01-4826-8482-b240877df839"
        megaitems.append(itemFeed)
        
        var item2 = MGLandingItemData()
        item2.title = "mg.megageneral.componentcollection.item.two".localized
        item2.thumbUrl = "https://myfacemood.com/wp-content/uploads/2016/12/BitTorrent-Video-Streaming-per-iPhone.png"
        megaitems.append(item2)
        
        var item4 = MGLandingItemData()
        item4.title = "mg.megageneral.componentcollection.item.three".localized
        item4.thumbUrl = "https://www.apple.com/v/apple-music/i/images/shared/og_image.png"
        megaitems.append(item4)
        
        var itemWeb = MGLandingItemData()
        itemWeb.title = "mg.megageneral.componentcollection.item.four".localized
        itemWeb.thumbUrl = "https://clarivate.com/wp-content/uploads/2017/05/antifraud-darkweb-and-cyber-intelligence-560x320.jpg"
        megaitems.append(itemWeb)
        
        var itemone = MGLandingItemData()
        itemone.title = "mg.megageneral.componentcollection.item.five".localized
        itemone.thumbUrl = "https://snazzy-maps-cdn.azureedge.net/assets/37-lunar-landscape.png?v=20170626074350"
        megaitems.append(itemone)
        
        var itemSett = MGLandingItemData()
        itemSett.title = "mg.megageneral.componentcollection.item.settings".localized
        itemSett.thumbUrl = "https://cdn.redmondpie.com/wp-content/uploads/2017/12/ios-12-dark-mode.png"
        megaitems.append(itemSett)
        
        return LandingAssets(
            string: LandingString(
                navigationTitle: "",
                title: "Scalable multipurpose component based iOS framework",
                subTitle: "MegaGeneral is a scalable multipurpose component based iOS framework. You can start develop many awesome apps from MegaGeneral framework. You can use a big sets of icons, fonts, and change dark theme with your personal custom theme.",
                userName: "Mega Team Builder",
                headline: "Scalable Multipurpose iOS Framework",
                collectionTitle: "Integrated kits"),
            font: LandingFont(
                title: (isiPad ? MGTemplate.Font(size: 65).medium : MGTemplate.Font(size: 35).medium)!,
                subtitle: (isiPad ? MGTemplate.Font(size: 32).light : MGTemplate.Font(size: 20).light)!,
                username: (isiPad ? MGTemplate.Font(size: 28).medium : MGTemplate.Font(size: 18).medium)!,
                headline: (isiPad ? MGTemplate.Font(size: 22).regular : MGTemplate.Font(size: 16).regular)!,
                collectionTitle: (isiPad ? MGTemplate.Font(size: 22).regular : MGTemplate.Font(size: 16).regular)!),
            image: LandingImage(
                heart: UIImage(icon: .fontAwesomeSolid(.heart), size: CGSize(width: 36, height: 36), textColor: .black)),
            color: LandingColor(
                primary: .red,
                backgroundView: MGTemplate.View.backgroundColor,
                navigationBar: MGTemplate.NavigationBar.backgroundColor,
                navigationBarTint: .white,
                collectionTitle: .white,
                collectionView: MGTemplate.View.backgroundColor),
            data: LandingData(
                userImageUrl: URL(string:"https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/MGIconLight.png?alt=media&token=b8bb255f-7ede-4b54-a8c0-b3a63ad661f6")!,
                collectionItems: megaitems,
                enableAds: true,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716"))
    }
}

struct LandingAssets: MGLandingAsset {
    var string: MGLandingString
    var font: MGLandingFont
    var image: MGLandingImage
    var color: MGLandingColor
    var data: MGLandingData
}

struct LandingString: MGLandingString {
    var navigationTitle: String
    var title: String
    var subTitle: String
    var userName: String
    var headline: String
    var collectionTitle: String
}

struct LandingFont: MGLandingFont {
    var title: UIFont
    var subtitle: UIFont
    var username: UIFont
    var headline: UIFont
    var collectionTitle: UIFont
}

struct LandingImage: MGLandingImage {
    var heart: UIImage
}

struct LandingColor: MGLandingColor {
    var primary: UIColor
    var backgroundView: UIColor
    var navigationBar: UIColor
    var navigationBarTint: UIColor
    var collectionTitle: UIColor
    var collectionView: UIColor
}

struct LandingData: MGLandingData {
    var userImageUrl: URL
    var collectionItems: [MGLandingItemData]
    var enableAds: Bool
    var adsUnitId: String
}


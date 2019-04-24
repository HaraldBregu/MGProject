// 
//  Assets.swift
//
//  Created by harald bregu on 20/04/2019.
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
import MGSideMenuKit
import MGLandingKit
import MGBrowserKit
import MGMapKit

class Assets {
    
}

extension Assets: SideMenuAssetsObject {}
extension Assets: LandingAssetsObject {}
extension Assets: BrowserAssetImpl {}
extension Assets: MapKitAsset {}

// MARK - MapKitAsset

protocol MapKitAsset {
    static var instance:MapAsset { get }
}

extension MapKitAsset {
    static var instance:MapAsset {
        
        var items:[MGMapDataItem] = []
        
        var london = MGMapDataItem()
        london.location = "London"
        london.latitude = 51.507222
        london.longitude = -0.1275
        items.append(london)
        
        var berlin = MGMapDataItem()
        berlin.location = "Berlin"
        berlin.latitude = 52.520008
        berlin.longitude = 13.404954
        items.append(berlin)
        
        var lyon = MGMapDataItem()
        lyon.location = "Lyon"
        lyon.latitude = 45.74846
        lyon.longitude = 4.84671
        items.append(lyon)
        
        var madrid = MGMapDataItem()
        madrid.location = "Madrid"
        madrid.latitude = 40.416775
        madrid.longitude = -3.703790
        items.append(madrid)
        
        var milano = MGMapDataItem()
        milano.location = "Milano"
        milano.latitude = 45.46427
        milano.longitude = 9.18951
        items.append(milano)
        
        var durres = MGMapDataItem()
        durres.location = "Durrës"
        durres.latitude = 41.32306
        durres.longitude = 19.44139
        items.append(durres)

        return MapAsset(
            string: MapString(
                title: "My Location",
                navigationTitle: "My Location"),
            font: MapFont(),
            image: MapImage(),
            color: MapColor(
                backgroundView: MGTemplate.View.backgroundColor,
                navigationBar: MGTemplate.NavigationBar.backgroundColor,
                navigationBarTint: .white,
                toolBar: MGTemplate.NavigationBar.backgroundColor,
                toolBarTint: .white),
            data: MapData(
                items: items))
    }
}

struct MapAsset: MGMapAsset {
    var string: MGMapString
    var font: MGMapFont
    var image: MGMapImage
    var color: MGMapColor
    var data: MGMapData
}

struct MapString: MGMapString {
    var title:String
    var navigationTitle:String
}

struct MapFont: MGMapFont {
    
}

struct MapImage: MGMapImage {
    
}

struct MapColor: MGMapColor {
    var backgroundView: UIColor
    var navigationBar: UIColor
    var navigationBarTint: UIColor
    var toolBar: UIColor
    var toolBarTint: UIColor
}

struct MapData: MGMapData {
    var items: [MGMapDataItem]
}

// MARK - MGBrowserAsset

protocol BrowserAssetImpl {
    static var instance:MGBrowserAsset { get }
}

extension BrowserAssetImpl {
    static var instance: MGBrowserAsset {
        return BrowserAsset(
            string: BrowserString(
                title: "The Next Web",
                navigationTitle: "The Next Web"),
            font: BrowserFont(
                primaryFont: MGTemplate.Font(size: 35).medium!),
            image: BrowserImage(
                navigationItemMenu: UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .white)),
            color: BrowserColor(
                backgroundView: MGTemplate.View.backgroundColor,
                navigationBar: MGTemplate.NavigationBar.backgroundColor,
                navigationBarTint: .white,
                toolBar: MGTemplate.NavigationBar.backgroundColor,
                toolBarTint: .white),
            data: BrowserData(url: "https://thenextweb.com/"))
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
    var primaryFont: UIFont
}

struct BrowserImage: MGBrowserImage {
    var navigationItemMenu: UIImage
}

struct BrowserColor: MGBrowserColor {
    var backgroundView      :UIColor
    var navigationBar       :UIColor
    var navigationBarTint   :UIColor
    var toolBar             :UIColor
    var toolBarTint         :UIColor
}

struct BrowserString: MGBrowserString {
    var title: String
    var navigationTitle: String
}

struct BrowserData: MGBrowserData {
    var url: String
}

// MARK - MGLandingAsset

protocol LandingAssetsObject {
    static var instance: LandingAssets { get }
}

extension LandingAssetsObject {
    static var instance: LandingAssets {
        
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
                collectionItems: megaitems))
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
}

// MARK - MGSideMenuAsset


protocol SideMenuAssetsObject {
    static var instance:SideMenuAssets { get }
}

extension SideMenuAssetsObject {
    static var instance: SideMenuAssets {
        
        var newData = [MGSideMenuItem]()
        
        let homeItem = MGSideMenuItem()
        homeItem.title = "Home".localized
        homeItem.icon = #imageLiteral(resourceName: "landing-page")
        homeItem.identifier = "menu.home.identifier"
        newData.append(homeItem)
        
        let videoItem = MGSideMenuItem()
        videoItem.title = "Video".localized
        videoItem.icon = #imageLiteral(resourceName: "youtube-1")
        videoItem.identifier = "menu.video.identifier"
        newData.append(videoItem)
        
        let audioItem = MGSideMenuItem()
        audioItem.title = "Audio".localized
        audioItem.icon = #imageLiteral(resourceName: "music-player (1)")
        audioItem.identifier = "menu.audio.identifier"
        newData.append(audioItem)
        
        let theNextWeb = MGSideMenuItem()
        theNextWeb.title = "The Next Web".localized
        theNextWeb.icon = #imageLiteral(resourceName: "tnw")
        theNextWeb.identifier = "menu.theNextWeb.identifier"
        newData.append(theNextWeb)
        
        let techCrunch = MGSideMenuItem()
        techCrunch.title = "Tech Crunch".localized
        techCrunch.icon = #imageLiteral(resourceName: "techcrunch")
        techCrunch.identifier = "menu.techCrunch.identifier"
        newData.append(techCrunch)
        
        let theVerge = MGSideMenuItem()
        theVerge.title = "The Verge".localized
        theVerge.icon = #imageLiteral(resourceName: "thv")
        theVerge.identifier = "menu.theVerge.identifier"
        newData.append(theVerge)
        
        let digitalTrend = MGSideMenuItem()
        digitalTrend.title = "Digital Trend".localized
        digitalTrend.icon = #imageLiteral(resourceName: "digitaltrend")
        digitalTrend.identifier = "menu.digitalTrend.identifier"
        newData.append(digitalTrend)
        
        let webBrowser = MGSideMenuItem()
        webBrowser.title = "menu.tableview.item.browser".localized
        webBrowser.icon = #imageLiteral(resourceName: "browser")
        webBrowser.identifier = "menu.webBrowser.identifier"
        newData.append(webBrowser)
        
        let maps = MGSideMenuItem()
        maps.title = "menu.tableview.item.map".localized
        maps.icon = #imageLiteral(resourceName: "map")
        maps.identifier = "menu.maps.identifier"
        newData.append(maps)
        
        let shopify = MGSideMenuItem()
        shopify.title = "menu.tableview.item.title.shopify".localized
        shopify.icon = #imageLiteral(resourceName: "shopify")
        shopify.identifier = "menu.shopify.identifier"
        newData.append(shopify)
        
        let youtube = MGSideMenuItem()
        youtube.title = "Youtube"
        youtube.icon = #imageLiteral(resourceName: "youtube")
        youtube.identifier = "menu.youtube.identifier"
        newData.append(youtube)
        
        let facebook = MGSideMenuItem()
        facebook.title = "menu.tableview.item.title.facebook".localized
        facebook.icon = #imageLiteral(resourceName: "facebook")
        facebook.identifier = "menu.facebook.identifier"
        newData.append(facebook)
        
        let instagram = MGSideMenuItem()
        instagram.title = "menu.tableview.item.title.instagram".localized
        instagram.icon = #imageLiteral(resourceName: "instagram")
        instagram.identifier = "menu.instagram.identifier"
        newData.append(instagram)
        
        let soundCloud = MGSideMenuItem()
        soundCloud.title = "menu.tableview.item.title.soundCloud".localized
        soundCloud.icon = #imageLiteral(resourceName: "soundcloud")
        soundCloud.identifier = "menu.soundCloud.identifier"
        newData.append(soundCloud)
        
        let tumblr = MGSideMenuItem()
        tumblr.title = "menu.tableview.item.title.tumblr".localized
        tumblr.icon = #imageLiteral(resourceName: "tumblr")
        tumblr.identifier = "menu.tumblr.identifier"
        newData.append(tumblr)
        
        let flick = MGSideMenuItem()
        flick.title = "menu.tableview.item.title.flick".localized
        flick.icon = #imageLiteral(resourceName: "flickr")
        flick.identifier = "menu.flick.identifier"
        newData.append(flick)
        
        let twitter = MGSideMenuItem()
        twitter.title = "menu.tableview.item.title.twitter".localized
        twitter.icon = #imageLiteral(resourceName: "twitter")
        twitter.identifier = "menu.twitter.identifier"
        newData.append(twitter)
        
        let pinterest = MGSideMenuItem()
        pinterest.title = "menu.tableview.item.title.pinterest".localized
        pinterest.icon = #imageLiteral(resourceName: "pinterest")
        pinterest.identifier = "menu.pinterest.identifier"
        newData.append(pinterest)
        
        let settings = MGSideMenuItem()
        settings.title = "menu.tableview.item.title.settings".localized
        settings.icon = UIImage(icon: .ionicons(IoniconsType.settings), size: CGSize(width: 30, height: 30), textColor: .white)
        settings.identifier = "menu.settings.identifier"
        newData.append(settings)
        
        return SideMenuAssets(
            string: SideMenuString(
                title: "Megageneral Inc."),
            font: SideMenuFont(
                title: nil),
            image: SideMenuImage(
                avatar: #imageLiteral(resourceName: "MGIconLight")),
            color: SideMenuColor(
                backgroundView: MGTemplate.View.backgroundColor,
                headerView: MGTemplate.View.backgroundColor,
                cellView: MGTemplate.View.backgroundColor,
                cellLabel: MGTemplate.View.tintColor),
            data: SideMenuData(
                items: newData))
    }
}

struct SideMenuAssets:MGSideMenuAsset {
    var string: MGSideMenuString
    var font: MGSideMenuFont
    var image: MGSideMenuImage
    var color: MGSideMenuColor
    var data: MGSideMenuData
}

struct SideMenuString:MGSideMenuString {
    var title: String
}

struct SideMenuFont:MGSideMenuFont {
    var title: UIFont?
}

struct SideMenuImage:MGSideMenuImage {
    var avatar: UIImage?
}

struct SideMenuColor:MGSideMenuColor {
    var backgroundView: UIColor
    var headerView: UIColor
    var cellView: UIColor
    var cellLabel: UIColor
}

struct SideMenuData:MGSideMenuData {
    var items: [MGSideMenuItem]
}

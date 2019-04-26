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
import MGFeedKit
import MGVideoPlayerKit
import MGAudioPlayerKit

class Assets {}

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

// MARK - THE NEXT WEB Asset

extension Assets: FeedAssetsObject {}

protocol FeedAssetsObject {
    static var instance:FeedAsset { get }
}

extension FeedAssetsObject {
    static var instance:FeedAsset {
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
            data: FeedData(url: ""))
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
}

// MARK - VideoPlayerAssets

extension Assets: VideoPlayerAssetsObject {}

protocol VideoPlayerAssetsObject {
    static var instance:FeedAsset { get }
}

extension VideoPlayerAssetsObject {
    static var instance:VideoPlayerAsset {
        
        var trailerList = [MGVideoPlayerItem]()
        
        let gotTrailer = MGVideoPlayerItem()
        gotTrailer.title = "Game Of Thrones"
        gotTrailer.description = "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss. It is an adaptation of A Song of Ice and Fire, George R. R. Martin's series of fantasy novels, the first of which is A Game of Thrones. It is filmed in Belfast and elsewhere in Northern Ireland, Canada, Croatia, Iceland, Malta, Morocco, Scotland, Spain, and the United States.[1] The series premiered on HBO in the United States on April 17, 2011, and its seventh season ended on August 27, 2017. The series will conclude with its eighth season premiering on April 14, 2019."
        gotTrailer.pubYear = "TV Series 2011"
        gotTrailer.category = "Action, Adventure, Drama"
        gotTrailer.starCount = 4
        gotTrailer.reviewCount = 66700
        gotTrailer.actors = [
            MGVideoPlayerActorItem(name: "Peter Dinklage", roleName: "Tyrion Lannister", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM1MTI5Mzc0MF5BMl5BanBnXkFtZTYwNzgzOTQz._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Lena Headey", roleName: "Cersei Lannister", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMzIwMjIwNjg0M15BMl5BanBnXkFtZTgwOTI3MDEzMDE@._V1_SY1000_CR0,0,765,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Emilia Clarke", roleName: "Daenerys Targaryen", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNjg3OTg4MDczMl5BMl5BanBnXkFtZTgwODc0NzUwNjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Kit Harington", roleName: "Jon Snow", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTA2NTI0NjYxMTBeQTJeQWpwZ15BbWU3MDIxMjgyNzY@._V1_SY1000_CR0,0,665,1000_AL_.jpg"),
        ]
        gotTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/gameofthrones.mp4?raw=true")
        gotTrailer.thumbUrl = URL(string: "https://www.rollingstone.it/wp-content/uploads/2018/07/daenerys-game-of-thrones-recap.jpg")
        trailerList.append(gotTrailer)
        
        let starWarsTrailer = MGVideoPlayerItem()
        starWarsTrailer.title = "Star Wars: The Force Awakens"
        starWarsTrailer.description = "Star Wars: The Force Awakens (also known as Star Wars: Episode VII – The Force Awakens) is a 2015 American epic space opera film produced, co-written and directed by J. J. Abrams. It is the first installment of the Star Wars sequel trilogy and the seventh installment of the main Star Wars film franchise, following Return of the Jedi (1983). The film stars Harrison Ford, Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong'o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Peter Mayhew, and Max von Sydow, and was produced by Lucasfilm Ltd. and Abrams's production company Bad Robot Productions. The Force Awakens is the first Star Wars film to not involve franchise creator George Lucas. Set 30 years after Return of the Jedi, the film follows Rey, Finn, and Poe Dameron's search for Luke Skywalker and their fight alongside the Resistance, led by General Leia Organa and veterans of the Rebel Alliance, against Kylo Ren and the First Order, a successor to the Galactic Empire."
        starWarsTrailer.pubYear = "16 December 2015"
        starWarsTrailer.category = "Action, Adventure, Fantasy"
        starWarsTrailer.starCount = 4.5
        starWarsTrailer.reviewCount = 770351
        starWarsTrailer.actors = [
            MGVideoPlayerActorItem(name: "Harrison Ford", roleName: "Han Solo", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTY4Mjg0NjIxOV5BMl5BanBnXkFtZTcwMTM2NTI3MQ@@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Mark Hamill", roleName: "Luke Skywalker", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOGY2MjI5MDQtOThmMC00ZGIwLWFmYjgtYWU4MzcxOGEwMGVkXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Carrie Fisher", roleName: "Princess Leia", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM4ODU5MDY4MV5BMl5BanBnXkFtZTgwODY1MjQ5MDI@._V1_SY1000_CR0,0,648,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Adam Driver", roleName: "Kylo Ren", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOWViYjUzOWMtMzRkZi00MjNkLTk4M2ItMTVkMDg5MzE2ZDYyXkEyXkFqcGdeQXVyODQwNjM3NDA@._V1_.jpg"),
        ]
        starWarsTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/starwars.mp4?raw=true")
        starWarsTrailer.thumbUrl = URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Video69/v4/e4/3d/a1/e43da14b-0354-62fb-304c-ad53f8ba9fa6/pr_source.lsr/268x0w.png")
        trailerList.append(starWarsTrailer)
        
        let thePunisherTrailer = MGVideoPlayerItem()
        thePunisherTrailer.title = "The Punisher"
        thePunisherTrailer.description = "Marvel's The Punisher, or simply The Punisher, is an American web television series created for Netflix by Steve Lightfoot, based on the Marvel Comics character of the same name. It is set in the Marvel Cinematic Universe (MCU), sharing continuity with the films and other television series of the franchise, and is a spin-off of Marvel's Daredevil. The series is produced by Marvel Television in association with ABC Studios and Bohemian Risk Productions, with Lightfoot serving as showrunner."
        thePunisherTrailer.pubYear = "TV Series (2017– )"
        thePunisherTrailer.category = " Action, Adventure, Crime"
        thePunisherTrailer.starCount = 5
        thePunisherTrailer.reviewCount = 133700
        thePunisherTrailer.actors = [
            MGVideoPlayerActorItem(name: "Jon Bernthal", roleName: "Frank Castle", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTcwNzA5MDg0OV5BMl5BanBnXkFtZTcwMTU2NjE0Nw@@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Amber Rose Revah", roleName: "Dinah Madani", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM1ODJhNjgtNGRiMy00YTU1LWIyNTctNDM2ZTliMzdkMDQ4XkEyXkFqcGdeQXVyNzUzNDE1NzM@._V1_SY1000_CR0,0,780,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Ben Barnes", roleName: "Billy Russo", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDkxMjI3MTMtYzM2NS00YjQzLWJkNjQtMzZiYTJmMzlhNDE3XkEyXkFqcGdeQXVyMTg2MTgxNjM@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Jason R. Moore", roleName: "Curtis Hoyle", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDNkMzk4OTMtM2YxNy00MjFjLTgzZjAtMTdhNmQ3YmE2ZDcyXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,848,1000_AL_.jpg"),
        ]
        thePunisherTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/thepunisher.mp4?raw=true")
        thePunisherTrailer.thumbUrl = URL(string: "https://i.redd.it/i4enbn2v5fwz.jpg")
        trailerList.append(thePunisherTrailer)

        let interstellarTrailer = MGVideoPlayerItem()
        interstellarTrailer.title = "Interstellar"
        interstellarTrailer.description = "Interstellar is a 2014 epic science fiction thriller film directed, co-written, and co-produced by Christopher Nolan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, and Michael Caine. Set in a dystopian future where humanity is struggling to survive, the film follows a group of astronauts who travel through a wormhole in search of a new home for humanity."
        interstellarTrailer.pubYear = "6 November 2014"
        interstellarTrailer.category = "Adventure, Drama, Sci-Fi"
        interstellarTrailer.starCount = 4
        interstellarTrailer.reviewCount = 1466700
        interstellarTrailer.actors = [
            MGVideoPlayerActorItem(name: "Ellen Burstyn", roleName: "Murph (Older)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTU4MjYxMDc3MF5BMl5BanBnXkFtZTYwNzU3MDIz._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Matthew McConaughey", roleName: "Cooper", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_SY1000_CR0,0,613,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Mackenzie Foy", roleName: "Murph (10 Yrs.)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BYTIyMzExODgtNzllNy00OWQwLTlhM2QtMWU1ZTI2MjgwMTQxXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,714,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "John Lithgow", roleName: "Donald", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQzMzUyNDkzNF5BMl5BanBnXkFtZTcwNTMwNTU5MQ@@._V1_.jpg"),
        ]
        interstellarTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/interstellar.mp4?raw=true")
        interstellarTrailer.thumbUrl = URL(string: "https://pad.mymovies.it/filmclub/2014/01/001/locandina.jpg")
        trailerList.append(interstellarTrailer)

        let ironManTrailer = MGVideoPlayerItem()
        ironManTrailer.title = "Iron Man 3"
        ironManTrailer.description = "When Tony Stark's world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution."
        ironManTrailer.pubYear = "24 April 2013"
        ironManTrailer.category = "Action, Adventure, Sci-Fi"
        ironManTrailer.starCount = 4
        ironManTrailer.reviewCount = 66700
        ironManTrailer.actors = [
            MGVideoPlayerActorItem(name: "Robert Downey Jr.", roleName: "Tony Stark", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_SY1000_CR0,0,664,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Gwyneth Paltrow", roleName: "Pepper Potts", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzIxOTQ1NTU1OV5BMl5BanBnXkFtZTcwMTQ4MDY0Nw@@._V1_SY1000_CR0,0,665,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Don Cheadle", roleName: "Colonel James Rhodes", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNDMxNDM3MzY5N15BMl5BanBnXkFtZTcwMjkzOTY4MQ@@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Guy Pearce", roleName: "Aldrich Killian", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTgyNzc2NzY3Nl5BMl5BanBnXkFtZTgwNTMzMzAwMjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        ]
        ironManTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/Iron%20Man%203%20--%20Trailer%20Marvel%20Ufficiale%20%20HD.mp4?raw=true")
        ironManTrailer.thumbUrl = URL(string: "https://img00.deviantart.net/4084/i/2015/286/9/c/ironman_3_digital_painting_by_nununugroho-d9cz9f8.jpg")
        trailerList.append(ironManTrailer)
        
        let fortniteTrailer = MGVideoPlayerItem()
        fortniteTrailer.title = "Fortnite"
        fortniteTrailer.description = "Fortnite is an online video game developed by Epic Games and released in 2017. It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite: Save the World, a cooperative shooter-survival game for up to four players to fight off zombie-like creatures and defend objects with fortifications they can build, Fortnite Battle Royale, a free-to-play battle royale game where up to 100 players fight to be the last person standing, and Fortnite Creative, where players are given complete freedom to create worlds and battle arenas. The first two game modes were released in 2017 as early access titles and Creative was released on December 6, 2018. Save the World is available only for Windows, macOS, PlayStation 4, and Xbox One, while Battle Royale has been released for those platforms in addition for Nintendo Switch, iOS and Android devices."
        fortniteTrailer.pubYear = "21 July 2017"
        fortniteTrailer.category = "Action, Adventure, Comedy | Video Game"
        fortniteTrailer.starCount = 3
        fortniteTrailer.reviewCount = 1700
        fortniteTrailer.actors = [
            MGVideoPlayerActorItem(name: "Adria Arjona", roleName: "Ramirez (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMGNlYTlmNTYtNGViOS00YjJkLWJhODQtNDA1OGFmODc3OGYzXkEyXkFqcGdeQXVyMzg1MzQxODU@._V1_SY1000_CR0,0,668,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "David Boat", roleName: "Kyle (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ1MTk3MTYzOV5BMl5BanBnXkFtZTcwNDM3NjM3Mg@@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Ashly Burch", roleName: "Ray (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ5NTA0OTY2Ml5BMl5BanBnXkFtZTgwMDUwNjkwNDE@._V1_SX1777_CR0,0,1777,999_AL_.jpg"),
            MGVideoPlayerActorItem(name: "David Chen", roleName: "(voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDY0MjA1ZDYtYmZiMy00MWQ5LTlmMWItNzM5NTdlZWY5YTM1XkEyXkFqcGdeQXVyMjQwNjQ2NTY@._V1_.jpg")
        ]
        fortniteTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/fortnite.mp4?raw=true")
        fortniteTrailer.thumbUrl = URL(string: "https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Fortnite_image1600w.jpg")
        trailerList.append(fortniteTrailer)
        
        let dragonTrainerTrailer = MGVideoPlayerItem()
        dragonTrainerTrailer.title = "Dragon Trainer"
        dragonTrainerTrailer.description = "How to Train Your Dragon is a 2010 American 3D computer-animated action fantasy film produced by DreamWorks Animation and distributed by Paramount Pictures. Loosely based on the 2003 book of the same name by British author Cressida Cowell, the film was directed by Chris Sanders and Dean DeBlois, the duo who wrote and directed Walt Disney Animation Studios' 2002 film Lilo & Stitch. It stars the voices of Jay Baruchel, Gerard Butler, Craig Ferguson, America Ferrera, Jonah Hill, Christopher Mintz-Plasse, T. J. Miller, and Kristen Wiig."
        dragonTrainerTrailer.pubYear = "26 March 2010"
        dragonTrainerTrailer.category = "Animation, Action, Adventure"
        dragonTrainerTrailer.starCount = 4
        dragonTrainerTrailer.reviewCount = 594700
        dragonTrainerTrailer.actors = [
            MGVideoPlayerActorItem(name: "Jay Baruchel", roleName: "Hiccup (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM5MjY0MzU0OV5BMl5BanBnXkFtZTcwOTE0NDA2NA@@._V1_SY1000_CR0,0,736,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Gerard Butler", roleName: "Stoick (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjE4NDMwMzc4Ml5BMl5BanBnXkFtZTcwMDg4Nzg4Mg@@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Craig Ferguson", roleName: "Gobber (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ1NDYxNDM0OF5BMl5BanBnXkFtZTcwNDg4Mjc5Nw@@._V1_SY1000_CR0,0,732,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "America Ferrera", roleName: "Astrid (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQyMDUzOTkxNF5BMl5BanBnXkFtZTcwNjMwNjk0OA@@._V1_SY1000_CR0,0,689,1000_AL_.jpg")
        ]
        dragonTrainerTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/dragontrainer.mp4?raw=true")
        dragonTrainerTrailer.thumbUrl = URL(string: "https://nerdmovieproductions.it/wp-content/uploads/2018/05/Schermata-2018-05-31-alle-17.52.34.png")
        trailerList.append(dragonTrainerTrailer)
        
        let thePrincipleTrailer = MGVideoPlayerItem()
        thePrincipleTrailer.title = "The Principle"
        thePrincipleTrailer.description = "The Principle is a 2014 American independent film produced by Rick DeLano and Robert Sungenis. It rejects the Copernican principle and supports the pseudoscientific,[2] long-superseded notion that Earth is at the center of the Universe. The film is narrated by Kate Mulgrew and features scientists such as Lawrence M. Krauss and Michio Kaku. Mulgrew and scientists who were interviewed in the film have repudiated the ideas advocated in the film and stated that their involvement was the result of being misled by the filmmaker."
        thePrincipleTrailer.pubYear = "24 October 2014"
        thePrincipleTrailer.category = "Documentary, News, Thriller"
        thePrincipleTrailer.starCount = 3.2
        thePrincipleTrailer.reviewCount = 334
        thePrincipleTrailer.actors = [
            MGVideoPlayerActorItem(name: "Michio Kaku", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNTE5ZGM4ZjUtNDk2Ny00NTZlLTk2ODktZWI2MmMxMDVlNWZiL2ltYWdlXkEyXkFqcGdeQXVyNzE5Mjk0NDg@._V1_SY1000_CR0,0,923,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Lawrence Krauss", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM5ODEzNzM0MV5BMl5BanBnXkFtZTgwNTcwODQwMDI@._V1_SY1000_CR0,0,667,1000_AL_.jpg"),
            MGVideoPlayerActorItem(name: "Kate Mulgrew", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOTY1MTc3MjcyNl5BMl5BanBnXkFtZTcwMDg4MDAwMg@@._V1_.jpg"),
            MGVideoPlayerActorItem(name: "Charissa Saverio", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BODc1MDZjNGItOGMyYi00Njg3LThjMDktMDIzYzFiY2U4YjE1XkEyXkFqcGdeQXVyOTAwMDcyMTA@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
        ]
        thePrincipleTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/thprinciple.mp4?raw=true")
        thePrincipleTrailer.thumbUrl = URL(string: "https://inohment.com/wp-content/uploads/2015/11/thePrinciple_G-.jpg")
        trailerList.append(thePrincipleTrailer)
        
        return VideoPlayerAsset(
            string: VideoPlayerString(
                title: "Movie Player",
                navigationBarTitle: "Movie Player",
                searchBarPlaceholder: "Search",
                navigationListPlayerPrompt: nil,
                navigationVideoPlayerPrompt: nil),
            font: VideoPlayerFont(
                tableViewCellTitle: nil,
                tableViewCellDescription: nil,
                tableViewCellSubtitle: nil,
                tableViewCellRating: nil,
                detailTitle: nil,
                detailDescription: nil,
                detailSubtitle: nil,
                detailRating: nil,
                actorListFullname: nil,
                actorListRolename: nil),
            image: VideoPlayerImage(
                likeNormal: UIImage(icon: .ionicons(IoniconsType.heart), size: CGSize(width: 30, height: 30), textColor: .white),
                likeSelected: UIImage(icon: .ionicons(IoniconsType.heart), size: CGSize(width: 30, height: 30), textColor: .white),
                likeHighlighted: UIImage(icon: .ionicons(IoniconsType.heart), size: CGSize(width: 30, height: 30), textColor: .white),
                shareNormal: UIImage(icon: .ionicons(IoniconsType.share), size: CGSize(width: 30, height: 30), textColor: .white)),
            color: VideoPlayerColor(
                navigationBar: .black,
                navigationBarContent: .white,
                toolBar: .black,
                toolBarContent: .white,
                view: .black,
                viewContent: .white,
                tableView: .black,
                tableViewSeparator: .white,
                refresh: .white,
                searchBarContent: .white,
                tableViewCell: .black,
                tableViewCellContent: .white,
                collectionView: .black,
                collectionViewContent: .white),
            data: VideoPlayerData(
                items: trailerList,
                darkKeyboard: true))
    }
}

struct VideoPlayerAsset: MGVideoPlayerAsset {
    var string: MGVideoPlayerString
    var font: MGVideoPlayerFont
    var image: MGVideoPlayerImage
    var color: MGVideoPlayerColor
    var data: MGVideoPlayerData
}

struct VideoPlayerString: MGVideoPlayerString {
    var title: String
    var navigationBarTitle: String
    var searchBarPlaceholder: String
    var navigationListPlayerPrompt: String?
    var navigationVideoPlayerPrompt: String?
}

struct VideoPlayerFont: MGVideoPlayerFont {
    var tableViewCellTitle: UIFont?
    var tableViewCellDescription: UIFont?
    var tableViewCellSubtitle: UIFont?
    var tableViewCellRating: UIFont?
    var detailTitle: UIFont?
    var detailDescription: UIFont?
    var detailSubtitle: UIFont?
    var detailRating: UIFont?
    var actorListFullname: UIFont?
    var actorListRolename: UIFont?
}

struct VideoPlayerImage: MGVideoPlayerImage {
    var likeNormal: UIImage
    var likeSelected: UIImage
    var likeHighlighted: UIImage
    var shareNormal: UIImage
}

struct VideoPlayerColor: MGVideoPlayerColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var tableView: UIColor
    var tableViewSeparator: UIColor
    var refresh: UIColor
    var searchBarContent: UIColor
    var tableViewCell: UIColor
    var tableViewCellContent: UIColor
    var collectionView: UIColor
    var collectionViewContent: UIColor
}

struct VideoPlayerData: MGVideoPlayerData {
    var items: [MGVideoPlayerItem]?
    var darkKeyboard: Bool
}

// MARK - AudioPlayerAssets

extension Assets: AudioPlayerAssetsObject {}

protocol AudioPlayerAssetsObject {
    static var instance:FeedAsset { get }
}

extension AudioPlayerAssetsObject {
    static var instance:AudioPlayerAsset {
        return AudioPlayerAsset(
            string: AudioPlayerString(
                title: "Audio Player",
                navigationBarTitle: "Audio Player",
                searchBarPlaceholder: "Search",
                navigationListPlayerPrompt: nil,
                navigationAudioPlayerPrompt: nil),
            font: AudioPlayerFont(
                tableViewCellTitle: nil,
                tableViewCellDescription: nil,
                tableViewCellSubtitle: nil,
                tableViewCellRating: nil,
                detailTitle: nil,
                detailDescription: nil,
                detailSubtitle: nil,
                detailRating: nil,
                actorListFullname: nil,
                actorListRolename: nil,
                playerTitle: nil,
                playerSubtitle: nil,
                playerYearPub: nil),
            image: AudioPlayerImage(
                likeNormal: #imageLiteral(resourceName: "youtube"),
                likeSelected: #imageLiteral(resourceName: "youtube"),
                likeHighlighted: #imageLiteral(resourceName: "youtube"),
                shareNormal: #imageLiteral(resourceName: "youtube"),
                tableViewCellIcon: #imageLiteral(resourceName: "youtube"),
                play: #imageLiteral(resourceName: "youtube"),
                pause: #imageLiteral(resourceName: "youtube"),
                thumbNormal: #imageLiteral(resourceName: "youtube"),
                thumbSelected: #imageLiteral(resourceName: "youtube"),
                stepForward: #imageLiteral(resourceName: "youtube"),
                stepBackward: #imageLiteral(resourceName: "youtube"),
                shuffleActive: #imageLiteral(resourceName: "youtube"),
                shuffleUnactive: #imageLiteral(resourceName: "youtube"),
                repeatActive: #imageLiteral(resourceName: "youtube"),
                repeatUnactive: #imageLiteral(resourceName: "youtube"),
                heartActive: #imageLiteral(resourceName: "youtube"),
                heartUnactive: #imageLiteral(resourceName: "youtube"),
                option: #imageLiteral(resourceName: "youtube"),
                share: #imageLiteral(resourceName: "youtube")),
            color: AudioPlayerColor(
                navigationBar: .black,
                navigationBarContent: .white,
                toolBar: .black,
                toolBarContent: .white,
                view: .black,
                viewContent: .white,
                tableView: .black,
                tableViewSeparator: .white,
                refresh: .white,
                searchBarContent: .white,
                tableViewCell: .black,
                tableViewCellContent: .white,
                collectionView: .black,
                collectionViewContent: .white,
                sliderMinimumTrackColor: .red,
                playerTitle: .red,
                playerSubtitle: .red,
                playerYearPub: .red,
                timeProgress: .red),
            data: AudioPlayerData(
                items: AudioData.items,
                darkKeyboard: true,
                bundle: .main))
    }
}

struct AudioPlayerAsset: MGAudioPlayerAsset {
    var string: MGAudioPlayerString
    var font: MGAudioPlayerFont
    var image: MGAudioPlayerImage
    var color: MGAudioPlayerColor
    var data: MGAudioPlayerData
}

struct AudioPlayerString: MGAudioPlayerString {
    var title: String
    var navigationBarTitle: String
    var searchBarPlaceholder: String
    var navigationListPlayerPrompt: String?
    var navigationAudioPlayerPrompt: String?
}

struct AudioPlayerFont: MGAudioPlayerFont {
    var tableViewCellTitle: UIFont?
    var tableViewCellDescription: UIFont?
    var tableViewCellSubtitle: UIFont?
    var tableViewCellRating: UIFont?
    var detailTitle: UIFont?
    var detailDescription: UIFont?
    var detailSubtitle: UIFont?
    var detailRating: UIFont?
    var actorListFullname: UIFont?
    var actorListRolename: UIFont?
    var playerTitle: UIFont?
    var playerSubtitle: UIFont?
    var playerYearPub: UIFont?
}

struct AudioPlayerImage: MGAudioPlayerImage {
    var likeNormal: UIImage
    var likeSelected: UIImage
    var likeHighlighted: UIImage
    var shareNormal: UIImage
    var tableViewCellIcon: UIImage
    var play: UIImage
    var pause: UIImage
    var thumbNormal: UIImage
    var thumbSelected: UIImage
    var stepForward: UIImage
    var stepBackward: UIImage
    var shuffleActive: UIImage
    var shuffleUnactive: UIImage
    var repeatActive: UIImage
    var repeatUnactive: UIImage
    var heartActive: UIImage
    var heartUnactive: UIImage
    var option: UIImage
    var share: UIImage
}

struct AudioPlayerColor: MGAudioPlayerColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var tableView: UIColor
    var tableViewSeparator: UIColor
    var refresh: UIColor
    var searchBarContent: UIColor
    var tableViewCell: UIColor
    var tableViewCellContent: UIColor
    var collectionView: UIColor
    var collectionViewContent: UIColor
    var sliderMinimumTrackColor: UIColor
    var playerTitle: UIColor
    var playerSubtitle: UIColor
    var playerYearPub: UIColor
    var timeProgress: UIColor
}

struct AudioPlayerData: MGAudioPlayerData {
    var items: [MGAudioPlayerItem]?
    var darkKeyboard: Bool
    var bundle: Bundle
}

public class AudioData {
    static var items:[MGAudioPlayerItem] {
        var audios = [MGAudioPlayerItem]()
        
        let audio4 = MGAudioPlayerItem()
        audio4.title = "Shoot To Trill"
        audio4.author = "AC/DC"
        audio4.pubYear = "2019"
        audio4.thumbUrlString = "https://img.discogs.com/qezpe-mrKMTlnUJimUtnFEPwD5A=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2829666-1302947530.jpeg.jpg"
        audio4.filename = "shoottothrill"
        audio4.filetype = "mp3"
        audios.append(audio4)
        
        let audio9 = MGAudioPlayerItem()
        audio9.title = "Thunderstruck"
        audio9.author = "AC/DC"
        audio9.pubYear = "2019"
        audio9.thumbUrlString = "https://townsquare.media/site/295/files/2016/04/ACDC.jpg"
        audio9.filename = "thunderstruck"
        audio9.filetype = "mp3"
        audios.append(audio9)
        
        let audio6 = MGAudioPlayerItem()
        audio6.title = "Levels"
        audio6.author = "AVICII"
        audio6.pubYear = "2019"
        audio6.thumbUrlString = "https://static.euronews.com/articles/stories/03/13/35/68/880x495_cmsv2_9f70e6ba-0504-5dbd-b227-2ae9e3f81bee-3133568.jpg"
        audio6.filename = "aviciilevels"
        audio6.filetype = "mp3"
        audios.append(audio6)
        
        let audio7 = MGAudioPlayerItem()
        audio7.title = "Wake Me Up"
        audio7.author = "AVICII"
        audio7.pubYear = "2019"
        audio7.thumbUrlString = "https://img.cache.vevo.com/thumb/cms/64ebe7c3e85cbf64cba44d581f60c2bf201536132118366.jpg"
        audio7.filename = "aviciiwakemeup"
        audio7.filetype = "mp3"
        audios.append(audio7)
        
        let audio0 = MGAudioPlayerItem()
        audio0.title = "The Rains of Castamere"
        audio0.author = "Arctic Monkeys"
        audio0.pubYear = "2019"
        audio0.thumbUrlString = "https://testitradotti.wikitesti.com/wp-content/uploads/2015/08/the-rains-of-castamere-traduzion.jpg"
        audio0.filename = "therainsofcastamere"
        audio0.filetype = "mp3"
        audios.append(audio0)
        
        let audio1 = MGAudioPlayerItem()
        audio1.title = "Zombie"
        audio1.author = "Bad Wolves"
        audio1.pubYear = "2019"
        audio1.thumbUrlString = "https://junkee.com/wp-content/uploads/2017/07/chester-brighter.jpg"
        audio1.filename = "zombiebadwolves"
        audio1.filetype = "mp3"
        audios.append(audio1)
        
        let audio2 = MGAudioPlayerItem()
        audio2.title = "Twenty One Pilots"
        audio2.author = "Chlorine"
        audio2.pubYear = "2019"
        audio2.thumbUrlString = "https://images.genius.com/ba602b559ff37ab14df0860b5a898436.1000x1000x1.jpg"
        audio2.filename = "twentyonepilots"
        audio2.filetype = "mp3"
        audios.append(audio2)
        
        let audio3 = MGAudioPlayerItem()
        audio3.title = "Bad Liar"
        audio3.author = "Imagine Dragons"
        audio3.pubYear = "2019"
        audio3.thumbUrlString = "https://upload.wikimedia.org/wikipedia/en/thumb/6/66/Imagine_Dragons_Bad_Liar.jpg/220px-Imagine_Dragons_Bad_Liar.jpg"
        audio3.filename = "badliar"
        audio3.filetype = "mp3"
        audios.append(audio3)
        
        let audio5 = MGAudioPlayerItem()
        audio5.title = "Try"
        audio5.author = "PINK"
        audio5.pubYear = "2019"
        audio5.thumbUrlString = "https://akns-images.eonline.com/eol_images/Entire_Site/2018711/rs_600x600-180811082229-600-pink.cm.81118.jpg"
        audio5.filename = "pinktry"
        audio5.filetype = "mp3"
        audios.append(audio5)
        
        let audio8 = MGAudioPlayerItem()
        audio8.title = "Numb"
        audio8.author = "Linkin Park"
        audio8.pubYear = "2019"
        audio8.thumbUrlString = "https://i.ytimg.com/vi/9XaS93WMRQQ/maxresdefault.jpg"
        audio8.filename = "linkinparknumb"
        audio8.filetype = "mp3"
        audios.append(audio8)
        
        return audios
    }
    
}

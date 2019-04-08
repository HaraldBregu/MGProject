// 
//  SideMenuComponentswift
//
//  Created by harald bregu on 26/03/2019.
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

import MGSideMenuKit
import MGTemplateKit
import MGLandingKit
import MGVideoPlayerKit
import MGAudioPlayerKit
import MGBrowserKit
import MGMapKit
import MGFeedKit

class SideMenuComponent: MGSideMenuDataSource, MGSideMenuDataDelegate {
    
    var landing:MGLanding!
    var videoPlayer:MGVideoPlayer!
    var audioPlayer:MGAudioPlayer!
    var browser:MGBrowser!
    var map:MGMap!
    var feed:MGFeed!
    
    var landingComponent = LandingComponent()
    
    init() {
        landing = MGLanding(dataSource: landingComponent, delegate: landingComponent)
        
        videoPlayer = MGVideoPlayer(dataList: VideoData.items)
        audioPlayer = MGAudioPlayer()
        let browserData = MGBrowserData(title: "Website", urlString: "https://thenextweb.com/")
        let browserDesign = MGBrowserDesign()
        browser = MGBrowser(data: browserData, design: browserDesign)
        let data = MGMapData(latitude: 21.282778, longitude: -157.829444)
        map = MGMap(mapData: data)
    }
    
    var data: MGSideMenuData {
        let data = MGSideMenuData()
        data.title = "MegaGeneral Ltd"
        data.image = #imageLiteral(resourceName: "MGIconLight")
        return data
    }
    
    var items: [MGSideMenuItem] {
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

        return newData
    }
    
    var layout: MGSideMenuLayout {
        let menuLayout = MGSideMenuLayout()
        menuLayout.backgroundColor = MGTemplate.View.backgroundColor
        menuLayout.tintColor = MGTemplate.View.tintColor
        return menuLayout
    }
    
    func primaryCenterController(fromController controller: MGMenuController) -> UIViewController {
        landingComponent.menuController = controller
        return landing.initialController
    }
    
    func centerController(item: MGSideMenuItem, forIndexPath indexPath: IndexPath, fromController controller: MGMenuController) -> UIViewController? {
        switch item.identifier {
        case "menu.home.identifier":
            return landing.initialController
        case "menu.video.identifier":
            return videoPlayer.listController
        case "menu.audio.identifier":
            return audioPlayer.listController
        case "menu.webBrowser.identifier":
            return browser.controller
        case "menu.maps.identifier":
            return map.controller
        case "menu.theNextWeb.identifier":
            let feedData = MGFeedData(title: "The Next Web", urlString: "https://thenextweb.com/feed/")
            feed = MGFeed(data: feedData)
            return feed.controller
        case "menu.techCrunch.identifier":
            let feedData = MGFeedData(title: "Tech Crunch", urlString: "https://techcrunch.com/feed/")
            feed = MGFeed(data: feedData)
            return feed.controller
        case "menu.theVerge.identifier":
            let feedData = MGFeedData(title: "The Verge", urlString: "https://www.theverge.com/rss/index.xml")
            feed = MGFeed(data: feedData)
            return feed.controller
        case "menu.digitalTrend.identifier":
            let feedData = MGFeedData(title: "Digital Trend", urlString: "https://www.digitaltrends.com/feed/")
            feed = MGFeed(data: feedData)
            return feed.controller
        default:
            return nil
        }
    }
    
    func menuController(_ controller: MGMenuController, didSelectItem item: MGSideMenuItem, atIndexPath indexPath: IndexPath) {
        
    }
    
    func menuController(_ controller: MGMenuController, canCloseMenuAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func closeMenu() {
        
    }
}


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
    var menuController:MGMenuController!

    var landingController:MGLandingController!
    var audioPlayer:MGAudioPlayer!
    var landingComponent = LandingComponent()
    
    init() {
        audioPlayer = MGAudioPlayer()
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
        menuController = controller
        landingComponent.menuController = controller
        landingController = MGLandingController.instance
        landingController.delegate = landingComponent
        landingController.dataSource = landingComponent
        landingController.assets = Assets.instance
        return UINavigationController(rootViewController: landingController)
    }
    
    func centerController(item: MGSideMenuItem, forIndexPath indexPath: IndexPath, fromController controller: MGMenuController) -> UIViewController? {
        switch item.identifier {
        case "menu.home.identifier":
            landingController = MGLandingController.instance
            landingController.delegate = landingComponent
            landingController.dataSource = landingComponent
            landingController.assets = Assets.instance
            return UINavigationController(rootViewController: landingController)
//        case "menu.video.identifier":
//            return videoPlayer.listController
        case "menu.audio.identifier":
            return audioPlayer.listController
        case "menu.webBrowser.identifier":
            let controller = MGBrowserController.controller
            controller.dataSource = self
            controller.delegate = self
            controller.asset = Assets.instance
            let data = MGBrowser()
            data.url = "https://thenextweb.com/"
            controller.data = data
            return UINavigationController(rootViewController: controller)
        case "menu.maps.identifier":
            let controller = MGMapController.controller
            let component = MapComponent()
            component.menuController = menuController
            controller.dataSource = component
            controller.delegate = component
            controller.assets = Assets.instance
            return UINavigationController(rootViewController: controller)
        case "menu.theNextWeb.identifier":
            let controller = MGFeedController.instance
            let data = MGFeed()
            data.url = "https://thenextweb.com/feed"
            controller.data = data
            let asset = MGFeedKit.MGAsset()
            let string = MGFeedKit.MGString()
            string.title = "The Next Web"
            asset.string = string
            let color = MGFeedKit.MGColor()
            color.backgroundView = MGTemplate.View.backgroundColor
            color.navigationBar = MGTemplate.NavigationBar.backgroundColor
            color.navigationBarTint = .white
            color.toolBar = MGTemplate.NavigationBar.backgroundColor
            color.toolBarTint = .white
            color.backgroundViewCell = .black
            color.cellTint = .white
            asset.color = color
            controller.assets = asset
            return UINavigationController(rootViewController: controller)
        case "menu.techCrunch.identifier":
            let controller = MGFeedController.instance
            let data = MGFeed()
            data.url = "https://techcrunch.com/feed"
            controller.data = data
            let asset = MGFeedKit.MGAsset()
            let string = MGFeedKit.MGString()
            string.title = "Tech Crunch"
            asset.string = string
            let color = MGFeedKit.MGColor()
            color.backgroundView = MGTemplate.View.backgroundColor
            color.navigationBar = MGTemplate.NavigationBar.backgroundColor
            color.navigationBarTint = .white
            color.toolBar = MGTemplate.NavigationBar.backgroundColor
            color.toolBarTint = .white
            color.backgroundViewCell = .black
            color.cellTint = .white
            asset.color = color
            controller.assets = asset
            return UINavigationController(rootViewController: controller)
        case "menu.theVerge.identifier":
            let controller = MGFeedController.instance
            let data = MGFeed()
            data.url = "https://www.theverge.com/rss/index.xml"
            controller.data = data
            let asset = MGFeedKit.MGAsset()
            let string = MGFeedKit.MGString()
            string.title = "The Verge"
            asset.string = string
            let color = MGFeedKit.MGColor()
            color.backgroundView = MGTemplate.View.backgroundColor
            color.navigationBar = MGTemplate.NavigationBar.backgroundColor
            color.navigationBarTint = .white
            color.toolBar = MGTemplate.NavigationBar.backgroundColor
            color.toolBarTint = .white
            color.backgroundViewCell = .black
            color.cellTint = .white
            asset.color = color
            controller.assets = asset
            return UINavigationController(rootViewController: controller)
        case "menu.digitalTrend.identifier":
            let controller = MGFeedController.instance
            let data = MGFeed()
            data.url = "https://www.digitaltrends.com/feed"
            controller.data = data
            let asset = MGFeedKit.MGAsset()
            let string = MGFeedKit.MGString()
            string.title = "Digital Trend"
            asset.string = string
            let color = MGFeedKit.MGColor()
            color.backgroundView = MGTemplate.View.backgroundColor
            color.navigationBar = MGTemplate.NavigationBar.backgroundColor
            color.navigationBarTint = .white
            color.toolBar = MGTemplate.NavigationBar.backgroundColor
            color.toolBarTint = .white
            color.backgroundViewCell = .black
            color.cellTint = .white
            asset.color = color
            controller.assets = asset
            return UINavigationController(rootViewController: controller)
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

extension SideMenuComponent: MGBrowserControllerDataSource, MGBrowserControllerDelegate {
    
    func leftBarButtonItems(_ controller: MGBrowserController) -> [UIBarButtonItem] {
        let menuButton = UIBarButtonItem()
        menuButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .white)
        menuButton.style = .plain
        menuButton.accessibilityIdentifier = "MENU"
        
        return [menuButton]
    }
    
    func toolBarButtonItems(_ controller: MGBrowserController) -> [UIBarButtonItem] {
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(icon: .fontAwesomeSolid(.chevronLeft), size: CGSize(width: 30, height: 30), textColor: .white)
        backButton.style = .plain
        backButton.accessibilityIdentifier = "BACK"
        
        let forwardButton = UIBarButtonItem()
        forwardButton.image = UIImage(icon: .fontAwesomeSolid(.chevronRight), size: CGSize(width: 30, height: 30), textColor: .white)
        forwardButton.style = .plain
        forwardButton.accessibilityIdentifier = "FORWARD"
        
        let reloadButton = UIBarButtonItem()
        reloadButton.image = UIImage(icon: .fontAwesomeSolid(.redo), size: CGSize(width: 30, height: 30), textColor: .white)
        reloadButton.style = .plain
        reloadButton.accessibilityIdentifier = "RELOAD"
        
        return [backButton, forwardButton, reloadButton]
    }
    
    func browserController(_ controller: MGBrowserController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        print("Navigation item is: \(String(describing: barButtonItem.accessibilityIdentifier))")

        if barButtonItem.accessibilityIdentifier == "MENU" {
            menuController.showMenu()
        }
    }

}

class MapComponent: MGMapControllerDataSource, MGMapControllerDelegate {
    var menuController:MGMenuController!

    func controller(_ controller: MGMapController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        print("Navigation item is: \(String(describing: barButtonItem.accessibilityIdentifier))")
        
        if barButtonItem.accessibilityIdentifier == "MENU" {
            menuController.showMenu()
        }
    }
    
    func leftBarButtonItems(_ controller: MGMapController) -> [UIBarButtonItem] {
        let menuButton = UIBarButtonItem()
        menuButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .white)
        menuButton.style = .plain
        menuButton.accessibilityIdentifier = "MENU"

        return [menuButton]
    }
    
    var items: [MGMap] {
        var items:[MGMap] = []
        
        let london = MGMap()
        london.location = "London"
        london.latitude = 51.507222
        london.longitude = -0.1275
        items.append(london)
        
        let berlin = MGMap()
        berlin.location = "Berlin"
        berlin.latitude = 52.520008
        berlin.longitude = 13.404954
        items.append(berlin)
        
        let lyon = MGMap()
        lyon.location = "Lyon"
        lyon.latitude = 45.74846
        lyon.longitude = 4.84671
        items.append(lyon)
        
        let madrid = MGMap()
        madrid.location = "Madrid"
        madrid.latitude = 40.416775
        madrid.longitude = -3.703790
        items.append(madrid)
        
        let milano = MGMap()
        milano.location = "Milano"
        milano.latitude = 45.46427
        milano.longitude = 9.18951
        items.append(milano)
        
        let durres = MGMap()
        durres.location = "Durrës"
        durres.latitude = 41.32306
        durres.longitude = 19.44139
        items.append(durres)
        
        return items
    }

}

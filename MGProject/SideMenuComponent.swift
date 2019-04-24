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

/*
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
    
//    var layout: MGSideMenuLayout {
//        let menuLayout = MGSideMenuLayout()
//        menuLayout.backgroundColor = MGTemplate.View.backgroundColor
//        menuLayout.tintColor = MGTemplate.View.tintColor
//        return menuLayout
//    }
    
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


*/

// 
//  AppDelegate.swift
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

import UIKit
import MGSideMenuKit
import MGTemplateKit
import SideMenuSwift
import MGLandingKit
import MGVideoPlayerKit
import MGAudioPlayerKit
import MGBrowserKit
import MGMapKit
import MGFeedKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var sideMenuController: MGSideMenuController!
    var landingController: MGLandingController!
    var browserController: MGBrowserController!
    var mapController: MGMapController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        MGTemplate.setup()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate {
    
    var rootViewController:UIViewController {
        sideMenuController = MGSideMenuController().instance
        sideMenuController.assets = Assets.instance
        sideMenuController.dataSource = self
        sideMenuController.delegate = self
        return sideMenuController
    }
    
}


extension AppDelegate:MGSideMenuControllerDataSource, MGSideMenuControllerDelegate {
   
    var centerController: UIViewController {
        landingController = MGLandingController.instance
        landingController.assets = Assets.instance
        landingController.delegate = self
        landingController.dataSource = self
        return UINavigationController(rootViewController: landingController)
    }
    
    func centerController(item: MGSideMenuItem, forIndexPath indexPath: IndexPath, fromController controller: MGMenuController) -> UIViewController? {
        switch item.identifier {
        case "menu.home.identifier":
            landingController = MGLandingController.instance
            landingController.assets = Assets.instance
            landingController.delegate = self
            landingController.dataSource = self
            return UINavigationController(rootViewController: landingController)
        case "menu.webBrowser.identifier":
            browserController = MGBrowserController.instance
            browserController.assets = Assets.instance
            browserController.dataSource = self
            browserController.delegate = self
            return UINavigationController(rootViewController: browserController)
        case "menu.maps.identifier":
            mapController = MGMapController.instance
            mapController.assets = Assets.instance
            mapController.dataSource = self
            mapController.delegate = self
            return UINavigationController(rootViewController: mapController)
        case "menu.theNextWeb.identifier":
            let controller = MGFeedController.instance
            controller.assets = Assets.instance
            controller.assets.string.title = "The Next Web"
            controller.assets.data.url = "https://thenextweb.com/feed"
            return UINavigationController(rootViewController: controller)
        case "menu.techCrunch.identifier":
            let controller = MGFeedController.instance
            controller.assets = Assets.instance
            controller.assets.string.title = "Tech Crunch"
            controller.assets.data.url = "https://techcrunch.com/feed"
            return UINavigationController(rootViewController: controller)
        case "menu.theVerge.identifier":
            let controller = MGFeedController.instance
            controller.assets = Assets.instance
            controller.assets.string.title = "The Verge"
            controller.assets.data.url = "https://www.theverge.com/rss/index.xml"
            return UINavigationController(rootViewController: controller)
        case "menu.digitalTrend.identifier":
            let controller = MGFeedController.instance
            controller.assets = Assets.instance
            controller.assets.string.title = "Digital Trends"
            controller.assets.data.url = "https://www.digitaltrends.com/feed"
            return UINavigationController(rootViewController: controller)
            //        case "menu.audio.identifier":
            //            return audioPlayer.listController

        default:
            return nil
        }
    }
    
    func controller(_ controller: MGMenuController, didSelectItem item: MGSideMenuItem, atIndexPath indexPath: IndexPath) {
        
    }
    
    func controller(_ controller: MGMenuController, canCloseItem item: MGSideMenuItem, atIndexPath indexPath: IndexPath) -> Bool {
        return true
    }

}

extension AppDelegate: MGLandingControllerDataSource, MGLandingControllerDelegate {

    func landingController(_ controller: MGLandingController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        print("Navigation item is: \(String(describing: barButtonItem.accessibilityIdentifier))")
        sideMenuController.showMenu()
    }
    
    func leftBarButtonItems(_ controller: MGLandingController) -> [UIBarButtonItem] {
        let button1 = UIBarButtonItem()
        button1.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        button1.style = .plain
        button1.accessibilityIdentifier = "MENU"
        
        return [button1]
    }

}

extension AppDelegate: MGBrowserControllerDataSource, MGBrowserControllerDelegate {
    
    func leftBarButtonItems(_ controller: MGBrowserController) -> [UIBarButtonItem] {
        let button1 = UIBarButtonItem()
        button1.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        button1.style = .plain
        button1.accessibilityIdentifier = "First"
        
        return [button1]
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
        sideMenuController.showMenu()
    }

}

extension AppDelegate: MGMapControllerDataSource, MGMapControllerDelegate {
    
    func leftBarButtonItems(_ controller: MGMapController) -> [UIBarButtonItem] {
        let button1 = UIBarButtonItem()
        button1.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        button1.style = .plain
        button1.accessibilityIdentifier = "First"
        
        return [button1]
    }
    
    func controller(_ controller: MGMapController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        sideMenuController.showMenu()
    }
    
}

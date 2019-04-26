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
    var feedController: MGFeedController!
    var videoPlayerListController: MGVideoPlayerListController!
    var audioPlayerListController: MGAudioPlayerListController!

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


extension AppDelegate: MGSideMenuControllerDataSource, MGSideMenuControllerDelegate {
   
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
            feedController = MGFeedController.instance
            feedController.assets = Assets.instance
            feedController.assets.string.title = "The Next Web"
            feedController.assets.data.url = "https://thenextweb.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.techCrunch.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Assets.instance
            feedController.assets.string.title = "Tech Crunch"
            feedController.assets.data.url = "https://techcrunch.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.theVerge.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Assets.instance
            feedController.assets.string.title = "The Verge"
            feedController.assets.data.url = "https://www.theverge.com/rss/index.xml"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.digitalTrend.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Assets.instance
            feedController.assets.string.title = "Digital Trends"
            feedController.assets.data.url = "https://www.digitaltrends.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.video.identifier":
            videoPlayerListController = MGVideoPlayerListController.instance
            videoPlayerListController.assets = Assets.instance
            videoPlayerListController.dataSource = self
            videoPlayerListController.delegate = self
            return UINavigationController(rootViewController: videoPlayerListController)
        case "menu.audio.identifier":
            audioPlayerListController = MGAudioPlayerListController.instance
            audioPlayerListController.assets = Assets.instance
            audioPlayerListController.delegate = self
            audioPlayerListController.dataSource = self
            return UINavigationController(rootViewController: audioPlayerListController)
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

    func leftBarButtonItems(_ controller: MGLandingController) -> [UIBarButtonItem] {
        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "MENU"
        
        return [menuBarButton]
    }
    
    func landingController(_ controller: MGLandingController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        sideMenuController.showMenu()
    }

}

extension AppDelegate: MGBrowserControllerDataSource, MGBrowserControllerDelegate {
    
    func leftBarButtonItems(_ controller: MGBrowserController) -> [UIBarButtonItem] {
        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "MENU"
        
        return [menuBarButton]
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
        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "MENU"
        
        return [menuBarButton]
    }
    
    func controller(_ controller: MGMapController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        sideMenuController.showMenu()
    }
    
}

extension AppDelegate: MGFeedControllerDataSource, MGFeedControllerDelegate {
    
    func leftBarButtonItems(_ controller: MGFeedController) -> [UIBarButtonItem] {
        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "MENU"
        
        return [menuBarButton]
    }
    
    func rightBarButtonItems(_ controller: MGFeedController) -> [UIBarButtonItem] {
        return []
    }
    
    func controller(_ controller: MGFeedController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        sideMenuController.showMenu()
    }
    
}

extension AppDelegate: MGVideoPlayerControllerDataSource, MGVideoPlayerControllerDelegate {
    
    func leftBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        if controller is MGVideoPlayerListController {
            let menuBarButton = UIBarButtonItem()
            menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
            menuBarButton.style = .plain
            menuBarButton.accessibilityIdentifier = "MENU"
            
            return [menuBarButton]
        }

        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "MENU"
        
        return [menuBarButton]
    }
    
    func rightBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {

        return []
    }

    func controller(_ controller: UIViewController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        sideMenuController.showMenu()

        //        let items = [item.title!, item.description!]
        //        let activityIndicator = UIActivityViewController(activityItems: items, applicationActivities: nil)
        //        present(activityIndicator, animated: true)
        //        if let popover = activityIndicator.popoverPresentationController {
        //            popover.sourceView = self.view
        //            popover.barButtonItem = barButtonItem
        //        }
        
        //        //        let alertController = UIAlertController(title: "mg.audioplayer.btm.option.sheet.title".localized, message: "mg.audioplayer.btm.option.sheet.description".localized, preferredStyle: .actionSheet)
        //        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.one".localized, style: .default, handler: { (action) in
        //        //        }))
        //        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.two".localized, style: .default, handler: { (action) in
        //        //        }))
        //        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.three".localized, style: .default, handler: { (action) in
        //        //        }))
        //        //        alertController.addAction(UIAlertAction(title: "mg.audioplayer.btm.option.sheet.opton.cancel".localized, style: .cancel, handler: { (action) in
        //        //        }))
        //        //        present(alertController, animated: true) { }

    }
    
    func controller(_ controller: UIViewController, didTapButton button: UIButton) {
    }

}

extension AppDelegate: MGAudioPlayerControllerDataSource, MGAudioPlayerControllerDelegate {}

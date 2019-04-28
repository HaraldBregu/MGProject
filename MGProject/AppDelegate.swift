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
import UserNotifications
import MGSideMenuKit
import MGTemplateKit
import SideMenuSwift
import MGLandingKit
import MGVideoPlayerKit
import MGAudioPlayerKit
import MGBrowserKit
import MGMapKit
import MGFeedKit
import Firebase
import FirebaseMessaging
import GoogleMobileAds


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

    private var remoteConfig = RemoteConfig.remoteConfig()
//    var interstitial: GADInterstitial!
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        MGTemplate.setup(assets: Template.default)
        
        FirebaseApp.configure()

        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()

        GADMobileAds.sharedInstance().start { (status) in
            print("Status GADMobileAds: \(status)")
        }

        remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.fetch(withExpirationDuration: TimeInterval(6.0)) { (status, error) -> Void in
            if status == .success {
                self.remoteConfig.activateFetched()
            } else {
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
        
        // Interstitial banner
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
//        let request = GADRequest()
//        interstitial.load(request)
        //interstitial.delegate = self

        // Rewarded banner
//        GADRewardBasedVideoAd.sharedInstance().delegate = self
//        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: "ca-app-pub-3940256099942544/1712485313")

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
        sideMenuController.assets = AssetsData.setup
        sideMenuController.dataSource = self
        sideMenuController.delegate = self
        return sideMenuController
    }
    
}

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("didReceive remoteMessage: \(remoteMessage.appData)")
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
     
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler()
    }
}

extension AppDelegate: MGSideMenuControllerDataSource, MGSideMenuControllerDelegate {}
extension AppDelegate: MGLandingControllerDataSource, MGLandingControllerDelegate {}
extension AppDelegate: MGMapControllerDataSource, MGMapControllerDelegate {}
extension AppDelegate: MGAudioPlayerControllerDataSource, MGAudioPlayerControllerDelegate {}
extension AppDelegate: MGVideoPlayerControllerDataSource, MGVideoPlayerControllerDelegate {}
extension AppDelegate: MGBrowserControllerDelegate, MGBrowserControllerDataSource {}
extension AppDelegate: MGFeedControllerDataSource, MGFeedControllerDelegate {}

extension AppDelegate {
    
    func leftBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "MENU"
        
        return [menuBarButton]
    }
    
    func rightBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        let menuBarButton = UIBarButtonItem()
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.addressBook), size: CGSize(width: 36, height: 36), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "OPTION"
        
        return [menuBarButton]
    }
    
    func toolBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        let backBarButton = UIBarButtonItem()
        backBarButton.image = UIImage(icon: .fontAwesomeSolid(.backward), size: CGSize(width: 36, height: 36), textColor: .black)
        backBarButton.style = .plain
        backBarButton.accessibilityIdentifier = "BACK"
        
        let forwardBarButton = UIBarButtonItem()
        forwardBarButton.image = UIImage(icon: .fontAwesomeSolid(.forward), size: CGSize(width: 36, height: 36), textColor: .black)
        forwardBarButton.style = .plain
        forwardBarButton.accessibilityIdentifier = "FORWARD"
        
        let reloadBarButton = UIBarButtonItem()
        reloadBarButton.image = UIImage(icon: .fontAwesomeSolid(.recycle), size: CGSize(width: 36, height: 36), textColor: .black)
        reloadBarButton.style = .plain
        reloadBarButton.accessibilityIdentifier = "RELOAD"
        
        return [reloadBarButton, backBarButton, forwardBarButton]
    }
    
    func controller(_ controller: UIViewController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
        //        if interstitial.isReady {
        //            interstitial.present(fromRootViewController: controller)
        //        } else {
        //            print("Ad wasn't ready")
        //        }
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: controller)
        }
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
    
    func controller(_ parentController: UIViewController) -> UIViewController {
//        landingController = MGLandingController.instance
//        landingController.assets = MGAssetsData.setup
//        landingController.delegate = self
//        landingController.dataSource = self
//        return UINavigationController(rootViewController: landingController)
        videoPlayerListController = MGVideoPlayerListController.instance
        videoPlayerListController.assets = AssetsData.setup
        videoPlayerListController.dataSource = self
        videoPlayerListController.delegate = self
        return UINavigationController(rootViewController: videoPlayerListController)

    }
    
    func controller(_ parentController: UIViewController, forIndexPath indexPath: IndexPath, withItem item: AnyObject) -> UIViewController? {
        
        let object = item as? MGSideMenuItem
        switch object?.identifier {
        case "menu.home.identifier":
            landingController = MGLandingController.instance
            landingController.assets = AssetsData.setup
            landingController.delegate = self
            landingController.dataSource = self
            return UINavigationController(rootViewController: landingController)
        case "menu.webBrowser.identifier":
            browserController = MGBrowserController.instance
            browserController.assets = AssetsData.setup
            browserController.dataSource = self
            browserController.delegate = self
            return UINavigationController(rootViewController: browserController)
        case "menu.maps.identifier":
            mapController = MGMapController.instance
            mapController.assets = AssetsData.setup
            mapController.dataSource = self
            mapController.delegate = self
            return UINavigationController(rootViewController: mapController)
        case "menu.theNextWeb.identifier":
            feedController = MGFeedController.instance
            feedController.assets = AssetsData.setup
            feedController.assets.string.title = "The Next Web"
            feedController.assets.data.url = "https://thenextweb.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.techCrunch.identifier":
            feedController = MGFeedController.instance
            feedController.assets = AssetsData.setup
            feedController.assets.string.title = "Tech Crunch"
            feedController.assets.data.url = "https://techcrunch.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.theVerge.identifier":
            feedController = MGFeedController.instance
            feedController.assets = AssetsData.setup
            feedController.assets.string.title = "The Verge"
            feedController.assets.data.url = "https://www.theverge.com/rss/index.xml"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.digitalTrend.identifier":
            feedController = MGFeedController.instance
            feedController.assets = AssetsData.setup
            feedController.assets.string.title = "Digital Trends"
            feedController.assets.data.url = "https://www.digitaltrends.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.video.identifier":
            videoPlayerListController = MGVideoPlayerListController.instance
            videoPlayerListController.assets = AssetsData.setup
            videoPlayerListController.dataSource = self
            videoPlayerListController.delegate = self
            return UINavigationController(rootViewController: videoPlayerListController)
        case "menu.audio.identifier":
            audioPlayerListController = MGAudioPlayerListController.instance
            audioPlayerListController.assets = AssetsData.setup
            audioPlayerListController.delegate = self
            audioPlayerListController.dataSource = self
            return UINavigationController(rootViewController: audioPlayerListController)
        default:
            return nil
        }
        
    }
    
    func controller(_ controller: UIViewController, didSelectItem item: AnyObject, atIndexPath indexPath: IndexPath) {
        
    }
    
    func controller(_ controller: UIViewController, canSelectItem item: AnyObject, atIndexPath indexPath: IndexPath) -> Bool {
        return true
    }

}

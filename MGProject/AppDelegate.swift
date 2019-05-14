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
import OneSignal
import MGSideMenuKit
import MGTemplateKit
import MGLandingKit
import MGVideoPlayerKit
import MGAudioPlayerKit
import MGBrowserKit
import MGMapKit
import MGFeedKit
import MGSettingsKit
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
    var settingsController: MGSettingsController!

    var remoteConfig = RemoteConfig.remoteConfig()
    var interstitial: GADInterstitial!
    let gcmMessageIDKey = "gcm.message_id"
    var enableInterstitial: Bool = false
    var enableRewarderBasedVideo: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        MGTemplate.configure()
        MGTemplate.use(color: TemplateColor.default)
        let template = (UIDevice.current.userInterfaceIdiom == .pad) ? TemplateFont.xLarge : TemplateFont.large
        MGTemplate.use(font: template)

        FirebaseApp.configure()
        remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: true)
        remoteConfig.fetch(withExpirationDuration: TimeInterval(6.0)) { (status, error) -> Void in
            if status == .success {
                self.remoteConfig.activateFetched()
            }
        }

        let oneSignalAppId = "408ed798-2b3d-4327-8f5f-02c45724b088"
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
        OneSignal.initWithLaunchOptions(launchOptions, appId: oneSignalAppId, handleNotificationAction: nil, settings: onesignalInitSettings)
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        OneSignal.promptForPushNotifications(userResponse: { print("User accepted notifications: \($0)") })

        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {(granted: Bool, error: Error?) in
            DispatchQueue.main.async { UIApplication.shared.registerForRemoteNotifications() }
        })
        Messaging.messaging().delegate = self

        GADMobileAds.sharedInstance().start { print("Status GADMobileAds: \($0)") }
        
        enableInterstitial = remoteConfig["enable_admob_interstitial"].boolValue
        enableRewarderBasedVideo = remoteConfig["enable_admob_rewarderbasedvideo"].boolValue
        
        if enableInterstitial { setupInterstitialAd(withUnitId: "ca-app-pub-3940256099942544/4411468910") }
        if enableRewarderBasedVideo { setupRewardBasedVideoAd(withUnitId: "ca-app-pub-3940256099942544/1712485313") }
        
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
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        //if let messageID = userInfo[gcmMessageIDKey] {
        //}
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

//        let theSilentPushContent = UNMutableNotificationContent()
//        theSilentPushContent.userInfo = userInfo
//        let theSilentPushRequest = UNNotificationRequest(identifier:UUID().uuidString, content: theSilentPushContent, trigger: nil)
        completionHandler(.newData)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

    }
    
}

extension AppDelegate {
    
    var rootViewController:UIViewController {
        sideMenuController = MGSideMenuController().instance
        sideMenuController.assets = Component.data
        sideMenuController.dataSource = self
        sideMenuController.delegate = self
        return sideMenuController
    }

    func setupInterstitialAd(withUnitId id: String) {
        interstitial = GADInterstitial(adUnitID: id)
        let request = GADRequest()
        interstitial.load(request)
        interstitial.delegate = self
    }
    
    func setupRewardBasedVideoAd(withUnitId id: String)  {
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(), withAdUnitID: id)
    }
    
}

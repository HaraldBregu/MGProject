// 
//  AppDelegate+Modules.swift
//
//  Created by harald bregu on 29/04/2019.
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
import MGSideMenuKit
import MGTemplateKit
import MGLandingKit
import MGVideoPlayerKit
import MGAudioPlayerKit
import MGBrowserKit
import MGMapKit
import MGFeedKit


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
        menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 30, height: 30), textColor: .black)
        menuBarButton.style = .plain
        menuBarButton.accessibilityIdentifier = "LEFT_SIDE_MENU"
        
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
        if barButtonItem.accessibilityIdentifier == "LEFT_SIDE_MENU" {
            sideMenuController.showMenu()
        }
        
        //        if interstitial.isReady {
        //            interstitial.present(fromRootViewController: controller)
        //        } else {
        //            print("Ad wasn't ready")
        //        }
//        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
//            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: controller)
//        }
        
        
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
        landingController = MGLandingController.instance
        landingController.assets = Component.data
        landingController.delegate = self
        landingController.dataSource = self
        return UINavigationController(rootViewController: landingController)

//        videoPlayerListController = MGVideoPlayerListController.instance
//        videoPlayerListController.assets = AssetsData.setup
//        videoPlayerListController.dataSource = self
//        videoPlayerListController.delegate = self
//        return UINavigationController(rootViewController: videoPlayerListController)
        
//        audioPlayerListController = MGAudioPlayerListController.instance
//        audioPlayerListController.assets = AssetsData.setup
//        audioPlayerListController.delegate = self
//        audioPlayerListController.dataSource = self
//        return UINavigationController(rootViewController: audioPlayerListController)
        
    }
    
    func controller(_ parentController: UIViewController, forIndexPath indexPath: IndexPath, withItem item: AnyObject) -> UIViewController? {
        
        let object = item as? MGSideMenuItem
        switch object?.identifier {
        case "menu.home.identifier":
            landingController = MGLandingController.instance
            landingController.assets = Component.data
            landingController.delegate = self
            landingController.dataSource = self
            return UINavigationController(rootViewController: landingController)
        case "menu.webBrowser.identifier":
            browserController = MGBrowserController.instance
            browserController.assets = Component.data
            browserController.dataSource = self
            browserController.delegate = self
            return UINavigationController(rootViewController: browserController)
        case "menu.maps.identifier":
            mapController = MGMapController.instance
            mapController.assets = Component.data
            mapController.dataSource = self
            mapController.delegate = self
            return UINavigationController(rootViewController: mapController)
        case "menu.theNextWeb.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Component.data
            feedController.assets.string.title = "The Next Web"
            feedController.assets.data.url = "https://thenextweb.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.techCrunch.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Component.data
            feedController.assets.string.title = "Tech Crunch"
            feedController.assets.data.url = "https://techcrunch.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.theVerge.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Component.data
            feedController.assets.string.title = "The Verge"
            feedController.assets.data.url = "https://www.theverge.com/rss/index.xml"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.digitalTrend.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Component.data
            feedController.assets.string.title = "Digital Trends"
            feedController.assets.data.url = "https://www.digitaltrends.com/feed"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.cnet.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Component.data
            feedController.assets.string.title = "CNET"
            feedController.assets.data.url = "https://www.cnet.com/rss/news/"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.weworewhat.identifier":
            feedController = MGFeedController.instance
            feedController.assets = Component.data
            feedController.assets.string.title = "We Wore What"
            feedController.assets.data.url = "https://weworewhat.com/feed/"
            feedController.dataSource = self
            feedController.delegate = self
            return UINavigationController(rootViewController: feedController)
        case "menu.video.identifier":
            videoPlayerListController = MGVideoPlayerListController.instance
            videoPlayerListController.assets = Component.data
            videoPlayerListController.dataSource = self
            videoPlayerListController.delegate = self
            return UINavigationController(rootViewController: videoPlayerListController)
        case "menu.audio.identifier":
            audioPlayerListController = MGAudioPlayerListController.instance
            audioPlayerListController.assets = Component.data
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

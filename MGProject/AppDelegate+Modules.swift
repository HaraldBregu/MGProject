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
import MediaPlayer
import MessageUI
import Firebase
import MGSideMenuKit
import MGTemplateKit
import MGLandingKit
import MGVideoPlayerKit
import MGAudioPlayerKit
import MGBrowserKit
import MGMapKit
import MGFeedKit
import MGSettingsKit
import MGTextKit

extension AppDelegate: MGSideMenuControllerDataSource, MGSideMenuControllerDelegate {}
extension AppDelegate: MGLandingControllerDataSource, MGLandingControllerDelegate {}
extension AppDelegate: MGMapControllerDataSource, MGMapControllerDelegate {}
extension AppDelegate: MGAudioPlayerControllerDataSource, MGAudioPlayerControllerDelegate {}
extension AppDelegate: MGVideoPlayerControllerDataSource, MGVideoPlayerControllerDelegate {}
extension AppDelegate: MGBrowserControllerDelegate, MGBrowserControllerDataSource {}
extension AppDelegate: MGFeedControllerDataSource, MGFeedControllerDelegate {}
extension AppDelegate: MGSettingsControllerDataSource, MGSettingsControllerDelegate {}

extension AppDelegate {
    
    func leftBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        if (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight) && (UIDevice.current.userInterfaceIdiom == .pad) {
            return []
        }
        
        if controller is MGLandingController || controller is MGBrowserController || controller is MGMapController || controller is MGFeedController || controller is MGAudioPlayerListController || controller is MGVideoPlayerListController || controller is MGSettingsController{
            let menuBarButton = UIBarButtonItem()
            menuBarButton.image = UIImage(icon: .fontAwesomeSolid(.bars), size: CGSize(width: 30, height: 30), textColor: .black)
            menuBarButton.style = .plain
            menuBarButton.accessibilityIdentifier = "LEFT_SIDE_MENU"
            
            return [menuBarButton]
        }
        return []
    }
    
    func rightBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        if controller is MGLandingController || controller is MGBrowserController || controller is MGMapController || controller is MGFeedController || controller is MGAudioPlayerListController || controller is MGVideoPlayerListController || controller is MGSettingsController {
            let menuBarButton = UIBarButtonItem()
            menuBarButton.image = UIImage(icon: .openIconic(.share) , size: CGSize(width: 36, height: 36), textColor: .black)
            menuBarButton.style = .plain
            menuBarButton.accessibilityIdentifier = "SHARE_OPTION"
            
            return [menuBarButton]
        }
        return []
    }
    
    func toolBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem] {
        if controller is MGBrowserController {
            
            let backBarButton = UIBarButtonItem()
            backBarButton.image = UIImage(icon: .openIconic(.chevronLeft), size: CGSize(width: 36, height: 36), textColor: .black)
            backBarButton.style = .plain
            backBarButton.accessibilityIdentifier = "BACK"
            
            let forwardBarButton = UIBarButtonItem()
            forwardBarButton.image = UIImage(icon: .openIconic(.chevronRight), size: CGSize(width: 36, height: 36), textColor: .black)
            forwardBarButton.style = .plain
            forwardBarButton.accessibilityIdentifier = "FORWARD"
            
            let reloadBarButton = UIBarButtonItem()
            reloadBarButton.image = UIImage(icon: .openIconic(.reload), size: CGSize(width: 36, height: 36), textColor: .black)
            reloadBarButton.style = .plain
            reloadBarButton.accessibilityIdentifier = "RELOAD"
            
            return [reloadBarButton, backBarButton, forwardBarButton]
        }
        
        return []
    }
    
    func controller(_ controller: UIViewController, didTapBarButtonItem barButtonItem: UIBarButtonItem) {
       
        if barButtonItem.accessibilityIdentifier == "LEFT_SIDE_MENU" {
            sideMenuController.showMenu()
        }
        
        if barButtonItem.accessibilityIdentifier == "SHARE_OPTION" {
            let items = ["MegaGeneral"]
            let activityIndicator = UIActivityViewController(activityItems: items, applicationActivities: nil)
            controller.present(activityIndicator, animated: true)
            if let popover = activityIndicator.popoverPresentationController {
                popover.sourceView = controller.view
                popover.barButtonItem = barButtonItem
            }
        }
        
        if enableInterstitial {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: controller)
            }
        }
        
        if enableRewarderBasedVideo {
            if GADRewardBasedVideoAd.sharedInstance().isReady == true {
                GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: controller)
            }
        }        
    }
    
    func controller(_ controller: UIViewController, didTapButton button: UIButton) {
        
    }
    
    func controller(_ parentController: UIViewController) -> UIViewController {
        landingController = MGLandingController.instance
        landingController.assets = Component.data
        landingController.delegate = self
        landingController.dataSource = self
        return UINavigationController(rootViewController: landingController)
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
        case "menu.privacypolicy.identifier":
            let controller = MGTextController.instance
            controller.assets = Component.data
            controller.leftBarButtonItems = {
                let button2 = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
                return [button2]
            }
            controller.rightBarButtonItems = {
                let button2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
                return [button2]
            }
            controller.textData = {
                //return MGTextData(type: .text("This is an example"))
                //return MGTextData(type: .attributed(attributedQuote))
                //return MGTextData(type: .plain(filename: "example", fileExtension: "txt") )
                return MGTextData(type: .rtf(filename: "example", fileExtension: "rtf") )
                //return MGTextData(type: .html(filename: "example", fileExtension: "html") )
            }
            return UINavigationController(rootViewController: controller)
        case "menu.settings.identifier":
            settingsController = MGSettingsController.instance
            settingsController.assets =  Component.data
            settingsController.delegate = self
            settingsController.dataSource = self
            return UINavigationController(rootViewController: settingsController)
        default:
            return nil
        }
        
    }
    
    func controller(_ controller: UIViewController, didSelectItem item: AnyObject, atIndexPath indexPath: IndexPath) {
        
    }
    
    func controller(_ controller: UIViewController, canSelectItem item: AnyObject, atIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    func controller(_ controller: UIViewController, didSelectItem item: MGSettingsItem) {
        print("item title: \(String(describing: item.title))")
        print("item slider value: \(String(describing: item.slider?.value))")
        print("item switch value: \(String(describing: item.switch?.state))")
        if item.title == "Light", let value = item.slider?.value {
            UIScreen.main.brightness = CGFloat(value)
        } else if item.title == "Sound", let value = item.slider?.value {
            MPVolumeView.setVolume(value)
        }
    }

}

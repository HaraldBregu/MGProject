// 
//  SideMenuComponent.swift
//
//  Created by harald bregu on 28/04/2019.
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
import FirebaseRemoteConfig
import MGTemplateKit
import MGSideMenuKit


protocol SideMenuComponent {
    static var data: SideMenuAsset { get }
}

extension SideMenuComponent {
    
    static var data: SideMenuAsset {
        
        var newData = [MGSideMenuItem]()
        
        let homeItem = MGSideMenuItem()
        homeItem.title = "Dashboard"
        homeItem.icon = UIImage(icon: .openIconic(.home), size: CGSize(width: 24, height: 24), textColor: .white)
        homeItem.identifier = "menu.home.identifier"
        newData.append(homeItem)
        
        let webBrowser = MGSideMenuItem()
        webBrowser.title = "My Website"
        webBrowser.icon = UIImage(icon: .openIconic(.browser), size: CGSize(width: 24, height: 24), textColor: .white)
        webBrowser.identifier = "menu.webBrowser.identifier"
        newData.append(webBrowser)

        let maps = MGSideMenuItem()
        maps.title = "My Location"
        maps.icon = UIImage(icon: .openIconic(.mapMarker), size: CGSize(width: 24, height: 24), textColor: .white)
        maps.identifier = "menu.maps.identifier"
        newData.append(maps)
        
        let videoItem = MGSideMenuItem()
        videoItem.title = "Video Player"
        videoItem.icon = UIImage(icon: .ionicons(IoniconsType.videocamera), size: CGSize(width: 24, height: 24), textColor: .white, backgroundColor: .clear)
        videoItem.identifier = "menu.video.identifier"
        newData.append(videoItem)
        
        let audioItem = MGSideMenuItem()
        audioItem.title = "Audio Player"
        audioItem.icon = UIImage(icon: .ionicons(IoniconsType.musicNote), size: CGSize(width: 24, height: 24), textColor: .white, backgroundColor: .clear)
        audioItem.identifier = "menu.audio.identifier"
        newData.append(audioItem)

        let theNextWeb = MGSideMenuItem()
        theNextWeb.title = "The Next Web"
        theNextWeb.icon = #imageLiteral(resourceName: "tnw")
        theNextWeb.identifier = "menu.theNextWeb.identifier"
        newData.append(theNextWeb)
        
        let techCrunch = MGSideMenuItem()
        techCrunch.title = "Tech Crunch"
        techCrunch.icon = #imageLiteral(resourceName: "techcrunch")
        techCrunch.identifier = "menu.techCrunch.identifier"
        newData.append(techCrunch)
        
        let theVerge = MGSideMenuItem()
        theVerge.title = "The Verge"
        theVerge.icon = #imageLiteral(resourceName: "thv")
        theVerge.identifier = "menu.theVerge.identifier"
        newData.append(theVerge)
        
        let cnetItem = MGSideMenuItem()
        cnetItem.title = "CNET"
        cnetItem.icon = #imageLiteral(resourceName: "cnet")
        cnetItem.identifier = "menu.cnet.identifier"
        newData.append(cnetItem)

        let weworewhatItem = MGSideMenuItem()
        weworewhatItem.title = "We Wore What"
        weworewhatItem.icon = UIImage(icon: .fontAwesomeSolid(.heart), size: CGSize(width: 40, height: 40), textColor: .white)
        weworewhatItem.identifier = "menu.weworewhat.identifier"
        newData.append(weworewhatItem)

        let digitalTrend = MGSideMenuItem()
        digitalTrend.title = "Digital Trend"
        digitalTrend.icon = #imageLiteral(resourceName: "digitaltrend")
        digitalTrend.identifier = "menu.digitalTrend.identifier"
        newData.append(digitalTrend)
        
//        let settings = MGSideMenuItem()
//        settings.title = "Settings"
//        settings.icon = UIImage(icon: .ionicons(IoniconsType.androidSettings), size: CGSize(width: 24, height: 24), textColor: .white)
//        settings.identifier = "menu.settings.identifier"
//        newData.append(settings)

        return SideMenuAsset(
            string: SideMenuString(
                tableViewHeaderTitle: "Megageneral",
                tableViewHeaderSubtitle: "Multipurpose template"),
            font: SideMenuFont(
                tableViewHeaderTitle: MGTemplate.font.headline,
                tableViewHeaderSubtitle: MGTemplate.font.caption2,
                tableViewCellTitle: MGTemplate.font.body),
            image: SideMenuImage(
                tableViewHeaderImage: #imageLiteral(resourceName: "MGIconLight")),
            color: SideMenuColor(
                view: MGTemplate.color.sideBar,
                backgroundView: MGTemplate.color.sideBar,
                tableView: MGTemplate.color.sideBar,
                tableViewSeparator: MGTemplate.color.sideBar,
                tableViewCell: MGTemplate.color.sideBar,
                tableViewHeader: MGTemplate.color.sideBar,
                tableViewCellContent: .white,
                tableViewHeaderContent: .white),
            data: SideMenuData(
                items: newData,
                statusBarStyle: .lightContent))
    }
}

struct SideMenuAsset: MGSideMenuAsset {
    var string: MGSideMenuString
    var font: MGSideMenuFont
    var image: MGSideMenuImage
    var color: MGSideMenuColor
    var data: MGSideMenuData
}

struct SideMenuString: MGSideMenuString {
    var tableViewHeaderTitle: String
    var tableViewHeaderSubtitle: String
}

struct SideMenuFont: MGSideMenuFont {
    var tableViewHeaderTitle: UIFont?
    var tableViewHeaderSubtitle: UIFont?
    var tableViewCellTitle: UIFont?
}

struct SideMenuImage: MGSideMenuImage {
    var tableViewHeaderImage: UIImage?
}

struct SideMenuColor: MGSideMenuColor {
    var view: UIColor
    var backgroundView: UIColor
    var tableView: UIColor
    var tableViewSeparator: UIColor
    var tableViewCell: UIColor
    var tableViewHeader: UIColor
    var tableViewCellContent: UIColor
    var tableViewHeaderContent: UIColor
}

struct SideMenuData: MGSideMenuData {
    var items: [MGSideMenuItem]
    var statusBarStyle: UIStatusBarStyle
}

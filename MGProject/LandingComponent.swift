// 
//  LandingComponent.swift
//
//  Created by harald bregu on 30/03/2019.
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
import MGLandingKit
import MGTemplateKit
import MGSideMenuKit

class LandingComponent: MGLandingDelegate, MGLandingDataSource {
    var menuController:MGMenuController!
    
    var data: MGLandingData {
        var landingData = MGLandingData()
        
        landingData.title = "Scalable multipurpose component based iOS framework"
        landingData.subTitle = "MegaGeneral is a scalable multipurpose component based iOS framework. You can start develop many awesome apps from MegaGeneral framework. You can use a big sets of icons, fonts, and change dark theme with your personal custom theme."
        
        return landingData
    }
    
    var items: [MGLandingItemData] {
        var megaitems:[MGLandingItemData] = []
        
        var itemFeed = MGLandingItemData()
        itemFeed.title = "mg.megageneral.componentcollection.item.one".localized
        itemFeed.thumbUrl = "https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/Latest-News.jpg?alt=media&token=fb163c62-cc01-4826-8482-b240877df839"
        megaitems.append(itemFeed)
        
        var item2 = MGLandingItemData()
        item2.title = "mg.megageneral.componentcollection.item.two".localized
        item2.thumbUrl = "https://myfacemood.com/wp-content/uploads/2016/12/BitTorrent-Video-Streaming-per-iPhone.png"
        megaitems.append(item2)
        
        var item4 = MGLandingItemData()
        item4.title = "mg.megageneral.componentcollection.item.three".localized
        item4.thumbUrl = "https://www.apple.com/v/apple-music/i/images/shared/og_image.png"
        megaitems.append(item4)
        
        var itemWeb = MGLandingItemData()
        itemWeb.title = "mg.megageneral.componentcollection.item.four".localized
        itemWeb.thumbUrl = "https://clarivate.com/wp-content/uploads/2017/05/antifraud-darkweb-and-cyber-intelligence-560x320.jpg"
        megaitems.append(itemWeb)
        
        var itemone = MGLandingItemData()
        itemone.title = "mg.megageneral.componentcollection.item.five".localized
        itemone.thumbUrl = "https://snazzy-maps-cdn.azureedge.net/assets/37-lunar-landscape.png?v=20170626074350"
        megaitems.append(itemone)
        
        var itemSett = MGLandingItemData()
        itemSett.title = "mg.megageneral.componentcollection.item.settings".localized
        itemSett.thumbUrl = "https://cdn.redmondpie.com/wp-content/uploads/2017/12/ios-12-dark-mode.png"
        megaitems.append(itemSett)
        
        return megaitems
    }
    
    var layout: MGLandingLayout {
        let layout = MGLandingLayout()
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            layout.titleLabel.font = MGTemplate.Font(size: 35).medium
            layout.subTitleLabel.font = MGTemplate.Font(size: 20).light
            layout.usernameLabel.font = MGTemplate.Font(size: 18).medium
            layout.headlineLabel.font = MGTemplate.Font(size: 16).regular
            layout.collectionTitleLabel.font = MGTemplate.Font(size: 16).regular
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            layout.titleLabel.font = MGTemplate.Font(size: 65).medium
            layout.subTitleLabel.font = MGTemplate.Font(size: 32).light
            layout.usernameLabel.font = MGTemplate.Font(size: 28).medium
            layout.headlineLabel.font = MGTemplate.Font(size: 22).regular
            layout.collectionTitleLabel.font = MGTemplate.Font(size: 22).regular
        }
        
        layout.navigationItemMenu.image = UIImage(icon: .ionicons(IoniconsType.androidMenu), size: CGSize(width: 30, height: 30), textColor: .white)

        return layout
    }
    
    func landingController(_ controller: MGLandingController, didTapMenuNavigationItem: UIBarButtonItem) {
        
        menuController.showMenu()
    }
    
}

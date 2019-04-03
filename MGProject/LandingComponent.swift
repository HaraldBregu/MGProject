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

class LandingComponent: MGLandingDelegate, MGLandingDataSource {
    
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
        itemFeed.thumbUrl = "https://siliconcanals.nl/wp-content/uploads/2018/05/tnw-.jpg"
        megaitems.append(itemFeed)
        
        var item2 = MGLandingItemData()
        item2.title = "mg.megageneral.componentcollection.item.two".localized
        item2.thumbUrl = "https://myfacemood.com/wp-content/uploads/2016/12/BitTorrent-Video-Streaming-per-iPhone.png"
        megaitems.append(item2)
        
        var item4 = MGLandingItemData()
        item4.title = "mg.megageneral.componentcollection.item.three".localized
        item4.thumbUrl = "https://r7h9p6s7.stackpathcdn.com/wp-content/uploads/2007/11/south_africa_commercial_radio_stations.jpg"
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
        
//        layout.navigationItemMenu.image =#imageLiteral(resourceName: "image-1")
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            layout.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
            layout.subTitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 22)
            layout.usernameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
            layout.headlineLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
            layout.collectionTitleLabel.font = UIFont(name: "HelveticaNeue", size: 16)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            layout.titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 65)
            layout.subTitleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 25)
            layout.usernameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 32)
            layout.headlineLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
            layout.collectionTitleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 26)
        }
        
        return layout
    }
    
}

// 
//  MapComponent.swift
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
import MGTemplateKit
import MGMapKit

protocol MapComponent {
    static var data: MapAsset { get }
}

extension MapComponent {
    
    static var data: MapAsset {
        
        var items:[MGMapDataItem] = []
        
        var london = MGMapDataItem()
        london.location = "London"
        london.latitude = 51.507222
        london.longitude = -0.1275
        items.append(london)
        
        var berlin = MGMapDataItem()
        berlin.location = "Berlin"
        berlin.latitude = 52.520008
        berlin.longitude = 13.404954
        items.append(berlin)
        
        var lyon = MGMapDataItem()
        lyon.location = "Lyon"
        lyon.latitude = 45.74846
        lyon.longitude = 4.84671
        items.append(lyon)
        
        var madrid = MGMapDataItem()
        madrid.location = "Madrid"
        madrid.latitude = 40.416775
        madrid.longitude = -3.703790
        items.append(madrid)
        
        var milano = MGMapDataItem()
        milano.location = "Milano"
        milano.latitude = 45.46427
        milano.longitude = 9.18951
        items.append(milano)
        
        var durres = MGMapDataItem()
        durres.location = "Durrës"
        durres.latitude = 41.32306
        durres.longitude = 19.44139
        items.append(durres)
        
        return MapAsset(
            string: MapString(
                title: "My Location",
                navigationTitle: "My Location"),
            font: MapFont(),
            image: MapImage(),
            color: MapColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.primary,
                searchBar: MGTemplate.color.searchBar,
                searchBarContent: MGTemplate.color.text.primary,
                toolBar: MGTemplate.color.searchBar,
                toolBarContent: MGTemplate.color.text.primary,
                view: MGTemplate.color.view,
                viewContent: MGTemplate.color.text.primary),
            data: MapData(
                items: items))
    }
}

struct MapAsset: MGMapAsset {
    var string: MGMapString
    var font: MGMapFont
    var image: MGMapImage
    var color: MGMapColor
    var data: MGMapData
}

struct MapString: MGMapString {
    var title:String
    var navigationTitle:String
}

struct MapFont: MGMapFont {}

struct MapImage: MGMapImage {}

struct MapColor: MGMapColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var searchBar: UIColor
    var searchBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
}

struct MapData: MGMapData {
    var items: [MGMapDataItem]
}

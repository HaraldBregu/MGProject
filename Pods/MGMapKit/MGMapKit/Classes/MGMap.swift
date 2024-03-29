// 
//  MGMap.swift
//
//  Created by harald bregu on 31/03/2019.
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
import MapKit

public protocol MGMapAsset {
    var string: MGMapString { get set }
    var font: MGMapFont { get set }
    var image: MGMapImage { get set }
    var color: MGMapColor { get set }
    var data: MGMapData { get set }
}

public protocol MGMapString {
    var title: String { get set }
    var navigationTitle: String { get set }
}

public protocol MGMapFont {
    
}

public protocol MGMapImage {

}

public protocol MGMapColor {
    var navigationBar: UIColor { get set }
    var navigationBarContent: UIColor { get set }
    var searchBar: UIColor { get set }
    var searchBarContent: UIColor { get set }
    var toolBar: UIColor { get set }
    var toolBarContent: UIColor { get set }
    var view: UIColor { get set }
    var viewContent: UIColor { get set }
}

public protocol MGMapData {
    var items: [MGMapDataItem] { get set }
}

public struct MGMapDataItem {
    public var location: String!
    public var latitude: CLLocationDegrees!
    public var longitude: CLLocationDegrees!
    public init() {}
}

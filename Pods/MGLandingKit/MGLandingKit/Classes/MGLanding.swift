// 
//  MGLanding.swift
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


public struct MGLandingItemData {
    public var title:String!
    public var description:String!
    public var thumbUrl:String!
    public init() {}
}

public protocol MGLandingAsset {
    var string: MGLandingString { get set }
    var font: MGLandingFont { get set }
    var image: MGLandingImage { get set }
    var color: MGLandingColor { get set }
    var data: MGLandingData { get set }
}

public protocol MGLandingString {
    var navigationTitle: String { get set }
    var title: String { get set }
    var subTitle: String { get set }
    var userName: String { get set }
    var headline: String { get set }
    var collectionTitle: String { get set }
}

public protocol MGLandingFont {
    var title: UIFont { get set }
    var subtitle: UIFont { get set }
    var username: UIFont { get set }
    var headline: UIFont { get set }
    var collectionTitle: UIFont { get set }
}

public protocol MGLandingImage {
    var heart: UIImage { get set }
}

public protocol MGLandingColor {
    var primary: UIColor { get set }
    var backgroundView: UIColor { get set }
    var navigationBar: UIColor { get set }
    var navigationBarTint: UIColor { get set }
    var collectionTitle: UIColor { get set }
    var collectionView: UIColor { get set }
}

public protocol MGLandingData {
    var userImageUrl: URL { get set }
    var collectionItems: [MGLandingItemData] { get set }
}

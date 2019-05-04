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

public protocol MGLandingAsset {
    var string: MGLandingString { get set }
    var font: MGLandingFont { get set }
    var image: MGLandingImage { get set }
    var color: MGLandingColor { get set }
    var data: MGLandingData { get set }
}

public protocol MGLandingString {
    var title: String { get set }
    var navigationTitle: String { get set }
    var contentTitle: String { get set }
    var contentSubtitle: String { get set }
    var contentDescription: String { get set }
    var contentUsername: String { get set }
    var contentHeadline: String { get set }
    var contentCollectionTitle: String { get set }
}

public protocol MGLandingFont {
    var contentTitle: UIFont? { get set }
    var contentSubtitle: UIFont? { get set }
    var contentDescription: UIFont? { get set }
    var contentUsername: UIFont? { get set }
    var contentHeadline: UIFont? { get set }
    var contentCollectionTitle: UIFont? { get set }
    var collectionViewCellTitle: UIFont? { get set }
}

public protocol MGLandingImage {
    var userRightImage: UIImage { get set }
}

public protocol MGLandingColor {
    var navigationBar: UIColor { get set }
    var navigationBarContent: UIColor { get set }
    var toolBar: UIColor { get set }
    var toolBarContent: UIColor { get set }
    var view: UIColor { get set }
    var viewContent: UIColor { get set }
    var title: UIColor { get set }
    var subtitle: UIColor { get set }
    var description: UIColor { get set }
    var collectionView: UIColor { get set }
    var collectionViewCell: UIColor { get set }
    var collectionViewCellContent: UIColor { get set }
    var collectionViewCellTitle: UIColor { get set }
}

public protocol MGLandingData {
    var userImageUrl: URL { get set }
    var collectionItems: [MGLandingItemData] { get set }
    var enableAds: Bool { get set }
    var adsUnitId: String { get set }
    var statusBarStyle: UIStatusBarStyle { get set }
    var imageViewIndicatorStyle: UIActivityIndicatorView.Style { get set }
}

public struct MGLandingItemData {
    public var title: String!
    public var description: String!
    public var thumbUrl: String!
    public init() {}
}

// 
//  MGAudioPlayer.swift
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

public protocol MGAudioPlayerAsset {
    var string: MGAudioPlayerString { get set }
    var font: MGAudioPlayerFont { get set }
    var image: MGAudioPlayerImage { get set }
    var color: MGAudioPlayerColor { get set }
    var data: MGAudioPlayerData { get set }
}

public protocol MGAudioPlayerString {
    var title: String { get set }
    var navigationBarTitle: String { get set }
    var searchBarPlaceholder: String { get set }
    var navigationListPlayerPrompt: String? { get set }
    var navigationAudioPlayerPrompt: String? { get set }
}

public protocol MGAudioPlayerFont {
    var tableViewCellTitle: UIFont? { get set }
    var tableViewCellSubtitle: UIFont? { get set }
    var playerTitle: UIFont? { get set }
    var playerSubtitle: UIFont? { get set }
    var playerYearPub: UIFont? { get set }
}

public protocol MGAudioPlayerImage {
    var likeNormal: UIImage { get set }
    var likeSelected: UIImage { get set }
    var likeHighlighted: UIImage { get set }
    var shareNormal: UIImage { get set }
    var tableViewCellIcon: UIImage { get set }
    var play: UIImage { get set }
    var pause: UIImage { get set }
    var thumbNormal: UIImage { get set }
    var thumbSelected: UIImage { get set }
    var stepBackward: UIImage { get set }
    var stepForward: UIImage { get set }
    var shuffleActive: UIImage { get set }
    var shuffleUnactive: UIImage { get set }
    var repeatActive: UIImage { get set }
    var repeatUnactive: UIImage { get set }
    var heartActive: UIImage { get set }
    var heartUnactive: UIImage { get set }
    var option: UIImage { get set }
    var share: UIImage { get set }
}

public protocol MGAudioPlayerColor {
    var navigationBar: UIColor { get set }
    var navigationBarContent: UIColor { get set }
    var toolBar: UIColor { get set }
    var toolBarContent: UIColor { get set }
    var view: UIColor { get set }
    var viewContent: UIColor { get set }
    var tableView: UIColor { get set }
    var tableViewSeparator: UIColor { get set }
    var refresh: UIColor { get set }
    var searchBarContent: UIColor { get set }
    var tableViewCell: UIColor { get set }
    var tableViewCellContent: UIColor { get set }
    var collectionView: UIColor { get set }
    var collectionViewContent: UIColor { get set }
    var sliderMinimumTrackColor: UIColor { get set }
    var playerTitle: UIColor { get set }
    var playerSubtitle: UIColor { get set }
    var playerYearPub: UIColor { get set }
    var timeProgress: UIColor { get set }
}

public protocol MGAudioPlayerData {
    var items: [MGAudioPlayerItem]? { get set }
    var darkKeyboard: Bool { get set }
    var bundle: Bundle { get }
    var enableAds: Bool { get set }
    var adsUnitId: String { get set }
}

public class MGAudioPlayerItem {
    public var title: String!
    public var author: String!
    public var pubYear: String!
    public var thumbUrlString: String!
    public var filename: String!
    public var filetype: String!
    public init() {}
}

extension MGAudioPlayerItem: Equatable {
    public static func == (lhs: MGAudioPlayerItem, rhs: MGAudioPlayerItem) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

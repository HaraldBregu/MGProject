// 
//  MGSettings.swift
//
//  Created by harald bregu on 02/05/2019.
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

public protocol MGSettingsAsset {
    var string: MGSettingsString { get set }
    var font: MGSettingsFont { get set }
    var image: MGSettingsImage { get set }
    var color: MGSettingsColor { get set }
    var data: MGSettingsData { get set }
}

public protocol MGSettingsString {
    var title: String { get set }
    var navigationTitle: String { get set }
}

public protocol MGSettingsFont {
    var tableViewCellTitle: UIFont? { get set }
    var tableViewCellSubtitle: UIFont? { get set }
}

public protocol MGSettingsImage {

}

public protocol MGSettingsColor {
    var navigationBar: UIColor { get set }
    var navigationBarContent: UIColor { get set }
    var viewPrimary: UIColor { get set }
    var viewSecondary: UIColor { get set }
    var viewTertiary: UIColor { get set }
    var textPrimary: UIColor { get set }
    var textSecondary: UIColor { get set }
    var controlPrimary: UIColor { get set }
    var controlSecondary: UIColor { get set }
    var controlContent: UIColor { get set }
}

public protocol MGSettingsData {
    var items: [MGSettingsItem] { get set }
}

public class MGSettingsItem {
    public var title: String?
    public var subtitle: String?
    public var primaryImage: UIImage?
    public var indicatorImage: UIImage?
    public var section: MGSettingsSectionItem!
    public var slider: MGSettingsSliderItem? = nil
    public var `switch`: MGSettingsSwitchItem? = nil
    public init () {
    }
}

public class MGSettingsSectionItem {
    public var identifier: String?
    public var headerTitle: String?
    public var footerTitle: String?
    public init (identifier: String?, headerTitle: String? = nil, footerTitle: String? = nil) {
        self.identifier = identifier
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}

public class MGSettingsSliderItem {
    public var value: Float = 0.5
    public var minValue: Float = 0.0
    public var maxValue: Float = 1.0
    public var minImage: UIImage?
    public var maxImage: UIImage?
    public init (value: Float, minValue: Float, maxValue: Float) {
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
    }
}

public class MGSettingsSwitchItem {
    public var state: Bool = false
    public init (state: Bool) {
        self.state = state
    }
}

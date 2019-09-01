// 
//  SettingsComponent.swift
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
import MGSettingsKit
import MGTemplateKit
import MediaPlayer

protocol SettingsComponent {
    static var data: MGSettingsAsset { get }
}

extension SettingsComponent {
    static var data: MGSettingsAsset {
        
        var items = [MGSettingsItem]()
        
        let item = MGSettingsItem()
        item.section = MGSettingsSectionItem(identifier: "ACCOUNT")
        item.title = "MegaGeneral Team"
        item.subtitle = "One app. A  million opportunitieas"
        item.primaryImage = #imageLiteral(resourceName: "profile")
        item.indicatorImage = UIImage(icon: .ionicons(.iosArrowRight), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(item)
        
        let pushNotificationItem = MGSettingsItem()
        pushNotificationItem.section = MGSettingsSectionItem(identifier: "NOTIFICATIONS")
        pushNotificationItem.title = "Push notifications"
        pushNotificationItem.switch = MGSettingsSwitchItem(state: true)
        items.append(pushNotificationItem)
        
        let localNotificationItem = MGSettingsItem()
        localNotificationItem.section = MGSettingsSectionItem(identifier: "NOTIFICATIONS")
        localNotificationItem.title = "Local notifications"
        localNotificationItem.switch = MGSettingsSwitchItem(state: false)
        items.append(localNotificationItem)
        
        let debugModeDeveloper = MGSettingsItem()
        debugModeDeveloper.section = MGSettingsSectionItem(identifier: "APPLICATION")
        debugModeDeveloper.title = "Debug mode"
        debugModeDeveloper.switch = MGSettingsSwitchItem(state: true)
        items.append(debugModeDeveloper)
        
        let developerModeDeveloper = MGSettingsItem()
        developerModeDeveloper.section = MGSettingsSectionItem(identifier: "APPLICATION")
        developerModeDeveloper.title = "Developer"
        developerModeDeveloper.switch = MGSettingsSwitchItem(state: true)
        items.append(developerModeDeveloper)
        
        let backupDeveloperItem = MGSettingsItem()
        backupDeveloperItem.section = MGSettingsSectionItem(identifier: "APPLICATION")
        backupDeveloperItem.title = "Backup"
        backupDeveloperItem.switch = MGSettingsSwitchItem(state: false)
        items.append(backupDeveloperItem)
        
        let analytisItem = MGSettingsItem()
        analytisItem.section = MGSettingsSectionItem(identifier: "APPLICATION")
        analytisItem.title = "Analytics"
        analytisItem.switch = MGSettingsSwitchItem(state: true)
        items.append(analytisItem)
        
        let lightItem = MGSettingsItem()
        lightItem.section = MGSettingsSectionItem(identifier: "SETTINGS")
        lightItem.title = "Light"
        lightItem.slider = MGSettingsSliderItem(value: Float(UIScreen.main.brightness), minValue: 0.0, maxValue: 1.0)
        lightItem.slider?.minImage = UIImage(icon: .ionicons(.androidSunny), size: CGSize(width: 24, height: 24), textColor: .white)
        lightItem.slider?.maxImage = UIImage(icon: .ionicons(.androidSunny), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(lightItem)
        
        let soundItem = MGSettingsItem()
        soundItem.section = MGSettingsSectionItem(identifier: "SETTINGS")
        soundItem.title = "Sound"
        soundItem.slider = MGSettingsSliderItem(value: Float(UIScreen.main.brightness), minValue: 0.0, maxValue: 1.0)
        soundItem.slider?.minImage = UIImage(icon: .ionicons(.volumeLow), size: CGSize(width: 24, height: 24), textColor: .white)
        soundItem.slider?.maxImage = UIImage(icon: .ionicons(.volumeHigh), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(soundItem)

        let rateAppItem = MGSettingsItem()
        rateAppItem.section = MGSettingsSectionItem(identifier: "ACTIONS")
        rateAppItem.title = "Rate my app"
        rateAppItem.indicatorImage = UIImage(icon: .ionicons(.iosArrowRight), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(rateAppItem)
        
        let purchaseFeaturesItem = MGSettingsItem()
        purchaseFeaturesItem.section = MGSettingsSectionItem(identifier: "ACTIONS")
        purchaseFeaturesItem.title = "Purchase features"
        purchaseFeaturesItem.indicatorImage = UIImage(icon: .ionicons(.iosArrowRight), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(purchaseFeaturesItem)
        
        let privacyPolicyItem = MGSettingsItem()
        privacyPolicyItem.section = MGSettingsSectionItem(identifier: "INFORMATION", footerTitle: "Copyright (c) 2020 MegaGeneral. All Rights Reserved. This product is protected by copyright and distributed under licenses restricting copying, distribution and decompilation.")
        privacyPolicyItem.title = "Privacy policy"
        privacyPolicyItem.indicatorImage = UIImage(icon: .ionicons(.iosArrowRight), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(privacyPolicyItem)
        
        let termsAndConditionsItem = MGSettingsItem()
        termsAndConditionsItem.section = MGSettingsSectionItem(identifier: "INFORMATION")
        termsAndConditionsItem.title = "Terms and conditions"
        termsAndConditionsItem.indicatorImage = UIImage(icon: .ionicons(.iosArrowRight), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(termsAndConditionsItem)

        let helpItem = MGSettingsItem()
        helpItem.section = MGSettingsSectionItem(identifier: "INFORMATION")
        helpItem.title = "Help"
        helpItem.indicatorImage = UIImage(icon: .ionicons(.iosArrowRight), size: CGSize(width: 34, height: 34), textColor: .white)
        items.append(helpItem)

        return SettingsAsset(
            string: SettingsString(
                title: "Settings",
                navigationTitle: "Settings"),
            font: SettingsFont(
                tableViewCellTitle: UIFont.systemFont(ofSize: 17),
                tableViewCellSubtitle: UIFont.systemFont(ofSize: 15)),
            image: SettingsImage(),
            color: SettingsColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.navigationBar,
                viewPrimary: MGTemplate.color.view,
                viewSecondary: #colorLiteral(red: 0.1237459013, green: 0.1185017693, blue: 0.1878585809, alpha: 1),
                viewTertiary: #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1),
                textPrimary: MGTemplate.color.text.primary,
                textSecondary: #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1),
                controlPrimary: #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1),
                controlSecondary: #colorLiteral(red: 0.7137254902, green: 0.7137254902, blue: 0.7137254902, alpha: 1),
                controlContent: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
            data: SettingsData(items: items))
    }
}

struct SettingsAsset: MGSettingsAsset {
    var string: MGSettingsString
    var font: MGSettingsFont
    var image: MGSettingsImage
    var color: MGSettingsColor
    var data: MGSettingsData
}

struct SettingsString: MGSettingsString {
    var title: String
    var navigationTitle: String
}

struct SettingsFont: MGSettingsFont {
    var tableViewCellTitle: UIFont?
    var tableViewCellSubtitle: UIFont?
}

struct SettingsImage: MGSettingsImage {
}

struct SettingsColor: MGSettingsColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var viewPrimary: UIColor
    var viewSecondary: UIColor
    var viewTertiary: UIColor
    var textPrimary: UIColor
    var textSecondary: UIColor
    var controlPrimary: UIColor
    var controlSecondary: UIColor
    var controlContent: UIColor
}

struct SettingsData: MGSettingsData {
    var items: [MGSettingsItem]
}

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}

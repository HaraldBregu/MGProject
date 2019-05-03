// 
//  TemplateFont.swift
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
import MGTemplateKit

class TemplateFont {}
extension TemplateFont: TemplateFontOptions {}

protocol TemplateFontOptions {
    static var xSmall: TFont { get }
    static var small: TFont { get }
    static var medium: TFont { get }
    static var large: TFont { get }
    static var xLarge: TFont { get }
    static var xxLarge: TFont { get }
    static var xxxLarge: TFont { get }
}

extension TemplateFontOptions {
    static var xSmall: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(31),
            title1: MGFont.Roboto.regular.size(25),
            title2: MGFont.Roboto.regular.size(19),
            title3: MGFont.Roboto.regular.size(17),
            headline: MGFont.Roboto.medium.size(14),
            body: MGFont.Roboto.regular.size(14),
            callout: MGFont.Roboto.regular.size(13),
            subhead: MGFont.Roboto.regular.size(12),
            footnote: MGFont.Roboto.regular.size(12),
            caption1: MGFont.Roboto.regular.size(11),
            caption2: MGFont.Roboto.regular.size(11))
    }
    static var small: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(32),
            title1: MGFont.Roboto.regular.size(26),
            title2: MGFont.Roboto.regular.size(20),
            title3: MGFont.Roboto.regular.size(18),
            headline: MGFont.Roboto.medium.size(15),
            body: MGFont.Roboto.regular.size(15),
            callout: MGFont.Roboto.regular.size(14),
            subhead: MGFont.Roboto.regular.size(13),
            footnote: MGFont.Roboto.regular.size(12),
            caption1: MGFont.Roboto.regular.size(11),
            caption2: MGFont.Roboto.regular.size(11))
    }
    static var medium: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(33),
            title1: MGFont.Roboto.regular.size(27),
            title2: MGFont.Roboto.regular.size(21),
            title3: MGFont.Roboto.regular.size(19),
            headline: MGFont.Roboto.medium.size(16),
            body: MGFont.Roboto.regular.size(16),
            callout: MGFont.Roboto.regular.size(15),
            subhead: MGFont.Roboto.regular.size(14),
            footnote: MGFont.Roboto.regular.size(12),
            caption1: MGFont.Roboto.regular.size(11),
            caption2: MGFont.Roboto.regular.size(11))
    }
    static var large: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(34),
            title1: MGFont.Roboto.regular.size(28),
            title2: MGFont.Roboto.regular.size(22),
            title3: MGFont.Roboto.regular.size(20),
            headline: MGFont.Roboto.medium.size(17),
            body: MGFont.Roboto.regular.size(17),
            callout: MGFont.Roboto.regular.size(16),
            subhead: MGFont.Roboto.regular.size(15),
            footnote: MGFont.Roboto.regular.size(13),
            caption1: MGFont.Roboto.regular.size(12),
            caption2: MGFont.Roboto.regular.size(11))
    }
    static var xLarge: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(36),
            title1: MGFont.Roboto.regular.size(30),
            title2: MGFont.Roboto.regular.size(24),
            title3: MGFont.Roboto.regular.size(22),
            headline: MGFont.Roboto.medium.size(19),
            body: MGFont.Roboto.regular.size(19),
            callout: MGFont.Roboto.regular.size(18),
            subhead: MGFont.Roboto.regular.size(17),
            footnote: MGFont.Roboto.regular.size(15),
            caption1: MGFont.Roboto.regular.size(14),
            caption2: MGFont.Roboto.regular.size(13))
    }
    static var xxLarge: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(38),
            title1: MGFont.Roboto.regular.size(32),
            title2: MGFont.Roboto.regular.size(26),
            title3: MGFont.Roboto.regular.size(24),
            headline: MGFont.Roboto.medium.size(21),
            body: MGFont.Roboto.regular.size(21),
            callout: MGFont.Roboto.regular.size(20),
            subhead: MGFont.Roboto.regular.size(19),
            footnote: MGFont.Roboto.regular.size(17),
            caption1: MGFont.Roboto.regular.size(16),
            caption2: MGFont.Roboto.regular.size(15))
    }
    static var xxxLarge: TFont {
        return TFont(
            largeTitle: MGFont.Roboto.regular.size(40),
            title1: MGFont.Roboto.regular.size(34),
            title2: MGFont.Roboto.regular.size(28),
            title3: MGFont.Roboto.regular.size(26),
            headline: MGFont.Roboto.medium.size(23),
            body: MGFont.Roboto.regular.size(23),
            callout: MGFont.Roboto.regular.size(22),
            subhead: MGFont.Roboto.regular.size(21),
            footnote: MGFont.Roboto.regular.size(19),
            caption1: MGFont.Roboto.regular.size(18),
            caption2: MGFont.Roboto.regular.size(17))
    }
}

struct TFont: MGTemplateFont {
    var largeTitle: UIFont?
    var title1: UIFont?
    var title2: UIFont?
    var title3: UIFont?
    var headline: UIFont?
    var body: UIFont?
    var callout: UIFont?
    var subhead: UIFont?
    var footnote: UIFont?
    var caption1: UIFont?
    var caption2: UIFont?
}

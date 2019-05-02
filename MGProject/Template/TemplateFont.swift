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
    static var `default`: TFont { get }
}

extension TemplateFontOptions {
    static var `default`: TFont {
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

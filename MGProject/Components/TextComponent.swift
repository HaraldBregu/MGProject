// 
//  TextComponent.swift
//
//  Created by harald bregu on 01/09/2019.
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
import MGTextKit
import MGTemplateKit


protocol TextComponent {
    static var data: MGTextAsset { get }
}

extension TextComponent {
    static var data: MGTextAsset {
        return TextAsset(
            font: TextFont(),
            image: TextImage(),
            color: TextColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.navigationBar,
                view: MGTemplate.color.view,
                viewContent: MGTemplate.color.text.primary),
            string: TextString(
                title: "Terms & Conditions",
                navigationTitle: "Terms & Conditions"))
    }
}

struct TextAsset: MGTextAsset {
    var font: MGTextFont
    var image: MGTextImage
    var color: MGTextColor
    var string: MGTextString
}

struct TextFont: MGTextFont {
    
}

struct TextImage: MGTextImage {
    
}

struct TextColor: MGTextColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
}

struct TextString: MGTextString {
    var title:String
    var navigationTitle:String
}


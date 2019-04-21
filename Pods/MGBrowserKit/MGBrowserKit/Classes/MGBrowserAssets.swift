// 
//  MGBrowserAssets.swift
//
//  Created by harald bregu on 11/03/2019.
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

import UIKit


public protocol MGBrowserAsset {
    var string  :MGBrowserString    { get }
    var font    :MGBrowserFont      { get }
    var image   :MGBrowserImage     { get }
    var color   :MGBrowserColor     { get }
}

public protocol MGBrowserString {
    var title               :String { get }
    var navigationTitle     :String { get }
}

public protocol MGBrowserFont {
    var primaryFont         :UIFont { get }
}

public protocol MGBrowserImage {
    var navigationItemMenu  :UIImage { get }
}

public protocol MGBrowserColor {
    var backgroundView      :UIColor { get }
    var navigationBar       :UIColor { get }
    var navigationBarTint   :UIColor { get }
    var toolBar             :UIColor { get }
    var toolBarTint         :UIColor { get }
}

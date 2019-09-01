// 
//  MGText.swift
//
//  Created by harald bregu on 31/08/2019.
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

public protocol MGTextAsset {
    var string: MGTextString { get set }
    var font: MGTextFont { get set }
    var image: MGTextImage { get set }
    var color: MGTextColor { get set }
}

public protocol MGTextString {
    var title: String { get set }
    var navigationTitle: String { get set }
}

public protocol MGTextFont {
    
}

public protocol MGTextImage {
    
}

public protocol MGTextColor {
    var navigationBar: UIColor { get set }
    var navigationBarContent: UIColor { get set }
    var view: UIColor { get set }
    var viewContent: UIColor { get set }
}

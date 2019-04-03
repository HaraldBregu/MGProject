// 
//  MGLandingLayout.swift
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

public class MGLandingLayout {
    public var view:MGViewLayout!
    public var collectionView:MGViewLayout!
    public var navigationBar:MGNavigationBarLayout!
    public var navigationItemMenu:MGNavigationItemLayout!
    public var titleLabel:MGLabelLayout!
    public var subTitleLabel:MGLabelLayout!
    public var usernameLabel:MGLabelLayout!
    public var headlineLabel:MGLabelLayout!
    public var itemTitleLabel:MGLabelLayout!
    public var collectionTitleLabel:MGLabelLayout!
    public var heartImage:MGImageViewLayout!
    public init() {
        view = MGViewLayout()
        collectionView = MGViewLayout()
        navigationBar = MGNavigationBarLayout()
        navigationItemMenu = MGNavigationItemLayout()
        titleLabel = MGLabelLayout()
        subTitleLabel = MGLabelLayout()
        usernameLabel = MGLabelLayout()
        headlineLabel = MGLabelLayout()
        itemTitleLabel = MGLabelLayout()
        collectionTitleLabel = MGLabelLayout()
        heartImage = MGImageViewLayout()
    }
}

public class MGViewLayout {
    public var backgroundColor:UIColor!
    public init() {
        backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05098039216, alpha: 1)
    }
}
public class MGImageViewLayout {
    public var normal:UIImage!
    public var selected:UIImage!
    public init() {
        normal = UIImage()
        selected = UIImage()
    }
}


public class MGNavigationBarLayout {
    public var backgroundColor:UIColor!
    public var tintColor:UIColor!
    public init() {
        backgroundColor = #colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05098039216, alpha: 1)
        tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

public class MGNavigationItemLayout {
    public var image:UIImage!
    public init() {
        image = UIImage()
    }
}

public class MGLabelLayout {
    public var font: UIFont!
    public var tintColor: UIColor!
    public init() {
        font = UIFont()
        tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

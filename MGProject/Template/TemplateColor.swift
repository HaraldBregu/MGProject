// 
//  TemplateColor.swift
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

class TemplateColor {}

extension TemplateColor: TemplateColorOptions {}

protocol TemplateColorOptions {
    static var `default`: TColor { get }
}

extension TemplateColorOptions {
    
    static var `default`: TColor {
    
        return TColor(
            view: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            navigationBar: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            toolBar: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            sideBar: #colorLiteral(red: 0.07309625613, green: 0.06932412941, blue: 0.1093190402, alpha: 1),
            searchBar: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            scrollView: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableView: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableViewCell: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableViewSeparator: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableViewHeader: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableViewFooter: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableViewHeaderSection: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            tableViewFooterSection: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            collectionView: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            collectionViewCell: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            collectionViewHeader: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            collectionViewFooter: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            collectionViewHeaderSection: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            collectionViewFooterSection: #colorLiteral(red: 0.1032132573, green: 0.09788694507, blue: 0.1543604942, alpha: 1),
            activityIndicator: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            text: TemplateColorText(
                navigationBar: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                toolBar: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                primary: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                secondary: #colorLiteral(red: 0.9529411765, green: 0.968627451, blue: 0.9725490196, alpha: 0.7065681379),
                placeholder: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                disabled: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                error: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
    }
}

struct TColor: MGTemplateColor {
    var view: UIColor
    var navigationBar: UIColor
    var toolBar: UIColor
    var sideBar: UIColor
    var searchBar: UIColor
    var scrollView: UIColor
    var tableView: UIColor
    var tableViewCell: UIColor
    var tableViewSeparator: UIColor
    var tableViewHeader: UIColor
    var tableViewFooter: UIColor
    var tableViewHeaderSection: UIColor
    var tableViewFooterSection: UIColor
    var collectionView: UIColor
    var collectionViewCell: UIColor
    var collectionViewHeader: UIColor
    var collectionViewFooter: UIColor
    var collectionViewHeaderSection: UIColor
    var collectionViewFooterSection: UIColor
    var activityIndicator: UIColor
    var text: MGTemplateColorText
}

struct TemplateColorText: MGTemplateColorText {
    var navigationBar: UIColor
    var toolBar: UIColor
    var primary: UIColor
    var secondary: UIColor
    var placeholder: UIColor
    var disabled: UIColor
    var error: UIColor
}

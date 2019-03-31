// 
//  MGBrowserData.swift
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

import Foundation

/// MGBrowserData class
public class MGBrowserData {
    
    /**
     This is the title of Browser data object. This will be used in navigationbar title.
     
     - Returns: The title of the data.
     */
    public var title:String!
    
    /**
     This is the url of the website.
     
     - Returns: The website url.
     */
    public var urlString:String!
    
    /**
     Initializes a new MGBrowserData with data.
     
     - Parameters: all parameter to pass in the MGBrowserData object
     - title: The title of the website.
     - urlString: The string url of the website.

     - Returns: The object MGBrowserData returned.
     */
    public init(title:String, urlString:String) {
        self.title = title
        self.urlString = urlString
    }

}

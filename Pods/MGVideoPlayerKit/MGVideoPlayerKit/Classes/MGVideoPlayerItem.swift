// 
//  MGVideoPlayerItem.swift
//
//  Created by harald bregu on 16/03/2019.
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

public class MGVideoPlayerItem {
    public var title:String!
    public var description:String!
    public var pubYear:String!
    public var category:String!
    public var url: URL!
    public var thumbUrl: URL!
    public var starCount:Double!
    public var reviewCount:Int!
    public var actors:[MGVideoPlayerActorItem]!
    public var isFeatured:Bool = false

    public init() {
        
    }
    
}

public class MGVideoPlayerActorItem {
    public var name:String!
    public var roleName:String!
    public var pictureUrl:String!
    
    public init(name:String, roleName:String, pictureUrl:String) {
        self.name = name
        self.roleName = roleName
        self.pictureUrl = pictureUrl
    }

}

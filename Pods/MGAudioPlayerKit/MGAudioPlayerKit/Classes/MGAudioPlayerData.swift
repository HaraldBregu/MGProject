// 
//  MGAudioPlayerData.swift
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

public class MGAudioPlayerData {
    public var title:String!
    public var author:String!
    public var pubYear:String!
    public var thumbUrlString:String!
    public var filename:String!
    public var filetype:String!
    
    public init() {
        
    }
}

extension MGAudioPlayerData: Equatable {
    public static func == (lhs: MGAudioPlayerData, rhs: MGAudioPlayerData) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}


public class AudioData {
    
    static var items:[MGAudioPlayerData] {
        
        var audios = [MGAudioPlayerData]()
        
        let audio0 = MGAudioPlayerData()
        audio0.title = "The Rains of Castamere"
        audio0.author = "Arctic Monkeys"
        audio0.thumbUrlString = "https://testitradotti.wikitesti.com/wp-content/uploads/2015/08/the-rains-of-castamere-traduzion.jpg"
        audio0.filename = "therainsofcastamere"
        audio0.filetype = "mp3"
        
        let audio1 = MGAudioPlayerData()
        audio1.title = "Zombie"
        audio1.author = "Bad Wolves"
        audio1.thumbUrlString = "https://junkee.com/wp-content/uploads/2017/07/chester-brighter.jpg"
        audio1.filename = "zombiebadwolves"
        audio1.filetype = "mp3"
        
        let audio2 = MGAudioPlayerData()
        audio2.title = "Twenty One Pilots"
        audio2.author = "Chlorine"
        audio2.thumbUrlString = "https://images.genius.com/ba602b559ff37ab14df0860b5a898436.1000x1000x1.jpg"
        audio2.filename = "twentyonepilots"
        audio2.filetype = "mp3"
        
        let audio3 = MGAudioPlayerData()
        audio3.title = "Bad Liar"
        audio3.author = "Imagine Dragons"
        audio3.thumbUrlString = "https://upload.wikimedia.org/wikipedia/en/thumb/6/66/Imagine_Dragons_Bad_Liar.jpg/220px-Imagine_Dragons_Bad_Liar.jpg"
        audio3.filename = "badliar"
        audio3.filetype = "mp3"
        
        let audio5 = MGAudioPlayerData()
        audio5.title = "Try"
        audio5.author = "PINK"
        audio5.thumbUrlString = "https://akns-images.eonline.com/eol_images/Entire_Site/2018711/rs_600x600-180811082229-600-pink.cm.81118.jpg"
        audio5.filename = "pinktry"
        audio5.filetype = "mp3"
        
        let audio6 = MGAudioPlayerData()
        audio6.title = "Levels"
        audio6.author = "AVICII"
        audio6.thumbUrlString = "https://static.euronews.com/articles/stories/03/13/35/68/880x495_cmsv2_9f70e6ba-0504-5dbd-b227-2ae9e3f81bee-3133568.jpg"
        audio6.filename = "aviciilevels"
        audio6.filetype = "mp3"
        
        let audio7 = MGAudioPlayerData()
        audio7.title = "Wake Me Up"
        audio7.author = "AVICII"
        audio7.thumbUrlString = "https://img.cache.vevo.com/thumb/cms/64ebe7c3e85cbf64cba44d581f60c2bf201536132118366.jpg"
        audio7.filename = "aviciiwakemeup"
        audio7.filetype = "mp3"
        
        let audio8 = MGAudioPlayerData()
        audio8.title = "Numb"
        audio8.author = "Linkin Park"
        audio8.thumbUrlString = "https://i.ytimg.com/vi/9XaS93WMRQQ/maxresdefault.jpg"
        audio8.filename = "linkinparknumb"
        audio8.filetype = "mp3"
        
        let audio4 = MGAudioPlayerData()
        audio4.title = "Shoot To Trill"
        audio4.author = "AC/DC"
        audio4.thumbUrlString = "https://img.discogs.com/qezpe-mrKMTlnUJimUtnFEPwD5A=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2829666-1302947530.jpeg.jpg"
        audio4.filename = "shoottothrill"
        audio4.filetype = "mp3"
        
        let audio9 = MGAudioPlayerData()
        audio9.title = "Thunderstruck"
        audio9.author = "AC/DC"
        audio9.thumbUrlString = "https://townsquare.media/site/295/files/2016/04/ACDC.jpg"
        audio9.filename = "thunderstruck"
        audio9.filetype = "mp3"
        
        audios.append(audio4)
        audios.append(audio9)
        audios.append(audio6)
        audios.append(audio7)
        audios.append(audio0)
        audios.append(audio1)
        audios.append(audio2)
        audios.append(audio3)
        audios.append(audio5)
        audios.append(audio8)
        
        return audios
    }
    
}

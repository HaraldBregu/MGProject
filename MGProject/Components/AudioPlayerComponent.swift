// 
//  AudioPlayerComponent.swift
//
//  Created by harald bregu on 28/04/2019.
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
import MGAudioPlayerKit


protocol AudioPlayerComponent {
    static var data: AudioPlayerAsset { get }
}

extension AudioPlayerComponent {
    
    static var data: AudioPlayerAsset {
        
        var audios = [MGAudioPlayerItem]()
        
        let audio4 = MGAudioPlayerItem()
        audio4.title = "Shoot To Trill"
        audio4.author = "AC/DC"
        audio4.pubYear = "2019"
        audio4.thumbUrlString = "https://img.discogs.com/qezpe-mrKMTlnUJimUtnFEPwD5A=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2829666-1302947530.jpeg.jpg"
        audio4.filename = "shoottothrill"
        audio4.filetype = "mp3"
        audios.append(audio4)
        
        let audio9 = MGAudioPlayerItem()
        audio9.title = "Thunderstruck"
        audio9.author = "AC/DC"
        audio9.pubYear = "2019"
        audio9.thumbUrlString = "https://townsquare.media/site/295/files/2016/04/ACDC.jpg"
        audio9.filename = "thunderstruck"
        audio9.filetype = "mp3"
        audios.append(audio9)
        
        let audio6 = MGAudioPlayerItem()
        audio6.title = "Levels"
        audio6.author = "AVICII"
        audio6.pubYear = "2019"
        audio6.thumbUrlString = "https://static.euronews.com/articles/stories/03/13/35/68/880x495_cmsv2_9f70e6ba-0504-5dbd-b227-2ae9e3f81bee-3133568.jpg"
        audio6.filename = "aviciilevels"
        audio6.filetype = "mp3"
        audios.append(audio6)
        
        let audio7 = MGAudioPlayerItem()
        audio7.title = "Wake Me Up"
        audio7.author = "AVICII"
        audio7.pubYear = "2019"
        audio7.thumbUrlString = "https://img.cache.vevo.com/thumb/cms/64ebe7c3e85cbf64cba44d581f60c2bf201536132118366.jpg"
        audio7.filename = "aviciiwakemeup"
        audio7.filetype = "mp3"
        audios.append(audio7)
        
        let audio0 = MGAudioPlayerItem()
        audio0.title = "The Rains of Castamere"
        audio0.author = "Arctic Monkeys"
        audio0.pubYear = "2019"
        audio0.thumbUrlString = "https://testitradotti.wikitesti.com/wp-content/uploads/2015/08/the-rains-of-castamere-traduzion.jpg"
        audio0.filename = "therainsofcastamere"
        audio0.filetype = "mp3"
        audios.append(audio0)
        
        let audio1 = MGAudioPlayerItem()
        audio1.title = "Zombie"
        audio1.author = "Bad Wolves"
        audio1.pubYear = "2019"
        audio1.thumbUrlString = "https://junkee.com/wp-content/uploads/2017/07/chester-brighter.jpg"
        audio1.filename = "zombiebadwolves"
        audio1.filetype = "mp3"
        audios.append(audio1)
        
        let audio2 = MGAudioPlayerItem()
        audio2.title = "Twenty One Pilots"
        audio2.author = "Chlorine"
        audio2.pubYear = "2019"
        audio2.thumbUrlString = "https://images.genius.com/ba602b559ff37ab14df0860b5a898436.1000x1000x1.jpg"
        audio2.filename = "twentyonepilots"
        audio2.filetype = "mp3"
        audios.append(audio2)
        
        let audio3 = MGAudioPlayerItem()
        audio3.title = "Bad Liar"
        audio3.author = "Imagine Dragons"
        audio3.pubYear = "2019"
        audio3.thumbUrlString = "https://upload.wikimedia.org/wikipedia/en/thumb/6/66/Imagine_Dragons_Bad_Liar.jpg/220px-Imagine_Dragons_Bad_Liar.jpg"
        audio3.filename = "badliar"
        audio3.filetype = "mp3"
        audios.append(audio3)
        
        let audio5 = MGAudioPlayerItem()
        audio5.title = "Try"
        audio5.author = "PINK"
        audio5.pubYear = "2019"
        audio5.thumbUrlString = "https://akns-images.eonline.com/eol_images/Entire_Site/2018711/rs_600x600-180811082229-600-pink.cm.81118.jpg"
        audio5.filename = "pinktry"
        audio5.filetype = "mp3"
        audios.append(audio5)
        
        let audio8 = MGAudioPlayerItem()
        audio8.title = "Numb"
        audio8.author = "Linkin Park"
        audio8.pubYear = "2019"
        audio8.thumbUrlString = "https://i.ytimg.com/vi/9XaS93WMRQQ/maxresdefault.jpg"
        audio8.filename = "linkinparknumb"
        audio8.filetype = "mp3"
        audios.append(audio8)
        
        let ipad = UIDevice.current.userInterfaceIdiom == .pad
        let heartSize = (ipad ? CGSize(width: 60, height: 60) : CGSize(width: 30, height: 30))
        let heart0 = UIImage(icon: .ionicons(IoniconsType.iosHeart), size: heartSize, textColor: .white, backgroundColor: .clear)
        let heart = UIImage(icon: .ionicons(IoniconsType.iosHeartOutline), size: heartSize, textColor: .white, backgroundColor: .clear)

        return AudioPlayerAsset(
            string: AudioPlayerString(
                title: "Audio Player",
                navigationBarTitle: "Audio Player",
                searchBarPlaceholder: "Search",
                navigationListPlayerPrompt: nil,
                navigationAudioPlayerPrompt: nil),
            font: AudioPlayerFont(
                tableViewCellTitle: MGTemplate.font.title3,
                tableViewCellSubtitle: MGTemplate.font.body,
                playerTitle: MGTemplate.font.subhead,
                playerSubtitle: MGTemplate.font.subhead,
                playerYearPub: MGTemplate.font.subhead),
            image: AudioPlayerImage(
                likeNormal: heart0,
                likeSelected: heart,
                likeHighlighted: heart,
                shareNormal: UIImage(icon: .openIconic(.chevronRight), size: CGSize(width: 20, height: 20), textColor: .white),
                tableViewCellIcon: UIImage(icon: .openIconic(.chevronRight), size: CGSize(width: 20, height: 20), textColor: .white),
                play: UIImage(icon: .openIconic(.mediaPlay), size: CGSize(width: 50, height: 50), textColor: .white),
                pause: UIImage(icon: .openIconic(.mediaPause), size: CGSize(width: 50, height: 50), textColor: .white),
                thumbNormal: UIImage(icon: .openIconic(.thumbUp), size: CGSize(width: 20, height: 20), textColor: .white),
                thumbSelected: UIImage(icon: .openIconic(.thumbUp), size: CGSize(width: 20, height: 20), textColor: .white),
                stepForward: UIImage(icon: .openIconic(.mediaSkipForward), size: CGSize(width: 20, height: 20), textColor: .white),
                stepBackward: UIImage(icon: .openIconic(.mediaSkipBackward), size: CGSize(width: 20, height: 20), textColor: .white),
                shuffleActive: UIImage(icon: .openIconic(.random), size: CGSize(width: 20, height: 20), textColor: .white),
                shuffleUnactive: UIImage(icon: .openIconic(.random), size: CGSize(width: 20, height: 20), textColor: .white),
                repeatActive: UIImage(icon: .openIconic(.reload), size: CGSize(width: 20, height: 20), textColor: .white),
                repeatUnactive: UIImage(icon: .openIconic(.reload), size: CGSize(width: 20, height: 20), textColor: .white),
                heartActive: UIImage(icon: .openIconic(.heart), size: CGSize(width: 20, height: 20), textColor: .white),
                heartUnactive: UIImage(icon: .openIconic(.heart), size: CGSize(width: 20, height: 20), textColor: .white),
                option: UIImage(icon: .openIconic(.document), size: CGSize(width: 20, height: 20), textColor: .white),
                share: UIImage(icon: .openIconic(.share), size: CGSize(width: 20, height: 20), textColor: .white)),
            color: AudioPlayerColor(
                navigationBar: MGTemplate.color.navigationBar,
                navigationBarContent: MGTemplate.color.text.primary,
                toolBar: MGTemplate.color.toolBar,
                toolBarContent: MGTemplate.color.text.primary,
                view: MGTemplate.color.view,
                viewContent: MGTemplate.color.text.primary,
                tableView: MGTemplate.color.tableView,
                tableViewSeparator: MGTemplate.color.tableViewSeparator,
                refresh: MGTemplate.color.text.primary,
                searchBarContent: MGTemplate.color.text.primary,
                tableViewCell: MGTemplate.color.tableViewCell,
                tableViewCellContent: MGTemplate.color.text.primary,
                collectionView: MGTemplate.color.collectionView,
                collectionViewContent: MGTemplate.color.text.primary,
                sliderMinimumTrackColor: .red,
                playerTitle: .red,
                playerSubtitle: .red,
                playerYearPub: .red,
                timeProgress: .red),
            data: AudioPlayerData(
                items: audios,
                darkKeyboard: true,
                bundle: .main,
                enableAds: true,
                adsUnitId: ""))
    }
    
}

struct AudioPlayerAsset: MGAudioPlayerAsset {
    var string: MGAudioPlayerString
    var font: MGAudioPlayerFont
    var image: MGAudioPlayerImage
    var color: MGAudioPlayerColor
    var data: MGAudioPlayerData
}

struct AudioPlayerString: MGAudioPlayerString {
    var title: String
    var navigationBarTitle: String
    var searchBarPlaceholder: String
    var navigationListPlayerPrompt: String?
    var navigationAudioPlayerPrompt: String?
}

struct AudioPlayerFont: MGAudioPlayerFont {
    var tableViewCellTitle: UIFont?
    var tableViewCellSubtitle: UIFont?
    var playerTitle: UIFont?
    var playerSubtitle: UIFont?
    var playerYearPub: UIFont?
}

struct AudioPlayerImage: MGAudioPlayerImage {
    var likeNormal: UIImage
    var likeSelected: UIImage
    var likeHighlighted: UIImage
    var shareNormal: UIImage
    var tableViewCellIcon: UIImage
    var play: UIImage
    var pause: UIImage
    var thumbNormal: UIImage
    var thumbSelected: UIImage
    var stepForward: UIImage
    var stepBackward: UIImage
    var shuffleActive: UIImage
    var shuffleUnactive: UIImage
    var repeatActive: UIImage
    var repeatUnactive: UIImage
    var heartActive: UIImage
    var heartUnactive: UIImage
    var option: UIImage
    var share: UIImage
}

struct AudioPlayerColor: MGAudioPlayerColor {
    var navigationBar: UIColor
    var navigationBarContent: UIColor
    var toolBar: UIColor
    var toolBarContent: UIColor
    var view: UIColor
    var viewContent: UIColor
    var tableView: UIColor
    var tableViewSeparator: UIColor
    var refresh: UIColor
    var searchBarContent: UIColor
    var tableViewCell: UIColor
    var tableViewCellContent: UIColor
    var collectionView: UIColor
    var collectionViewContent: UIColor
    var sliderMinimumTrackColor: UIColor
    var playerTitle: UIColor
    var playerSubtitle: UIColor
    var playerYearPub: UIColor
    var timeProgress: UIColor
}

struct AudioPlayerData: MGAudioPlayerData {
    var items: [MGAudioPlayerItem]?
    var darkKeyboard: Bool
    var bundle: Bundle
    var enableAds: Bool
    var adsUnitId: String
}

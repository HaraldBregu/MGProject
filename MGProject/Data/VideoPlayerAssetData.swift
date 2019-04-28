// 
//  VideoPlayerAssetData.swift
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
import MGVideoPlayerKit

protocol VideoPlayerAssetData {
    static var setup: MGVideoPlayerAsset { get }
}

extension VideoPlayerAssetData {
    
    static var setup: MGVideoPlayerAsset {

        let ipad = UIDevice.current.userInterfaceIdiom == .pad
        
        let tableViewCellTitleFont = ipad ? UIFont(name: "HelveticaNeue-Medium", size: 34) : UIFont(name: "HelveticaNeue-Medium", size: 22)
        let tableViewCellSubtitle = ipad ? UIFont(name: "HelveticaNeue", size: 18) : UIFont(name: "HelveticaNeue", size: 12)
        let tableViewCellRating = ipad ? UIFont(name: "HelveticaNeue", size: 16) : UIFont(name: "HelveticaNeue", size: 14)
        let tableViewCellDescription = ipad ? UIFont(name: "HelveticaNeue", size: 20) : UIFont(name: "HelveticaNeue", size: 13)
        let detailTitle = ipad ? UIFont(name: "HelveticaNeue-Medium", size: 34) : UIFont(name: "HelveticaNeue-Medium", size: 22)
        let detailSubtitle = ipad ? UIFont(name: "HelveticaNeue", size: 18) : UIFont(name: "HelveticaNeue", size: 12)
        let detailRating = ipad ? UIFont(name: "HelveticaNeue", size: 16) : UIFont(name: "HelveticaNeue", size: 14)
        let detailDescription = ipad ? UIFont(name: "HelveticaNeue", size: 20) : UIFont(name: "HelveticaNeue", size: 13)
        let detailTopCasts = ipad ? UIFont(name: "HelveticaNeue-Medium", size: 21) : UIFont(name: "HelveticaNeue-Medium", size: 15)
        let detailCastsFullname = ipad ? UIFont(name: "HelveticaNeue-Medium", size: 16) : UIFont(name: "HelveticaNeue-Medium", size: 11)
        let detailCastsRolename = ipad ? UIFont(name: "HelveticaNeue-Medium", size: 13) : UIFont(name: "HelveticaNeue-Medium", size: 8)
        
        let heartSize = (ipad ? CGSize(width: 60, height: 60) : CGSize(width: 30, height: 30))
        let heart0 = UIImage(icon: .ionicons(IoniconsType.iosHeart), size: heartSize, textColor: .white, backgroundColor: .clear)
        let heart = UIImage(icon: .ionicons(IoniconsType.iosHeartOutline), size: heartSize, textColor: .white, backgroundColor: .clear)
        
        return  VideoPlayerAsset(
            string: VideoPlayerString(
                title: "Movie Player",
                navigationBarTitle: "Movie Player",
                detailTitle: "Now Playing",
                detailNavigationBarTitle: "Now Playing",
                searchBarPlaceholder: "Search",
                navigationListPlayerPrompt: nil,
                navigationVideoPlayerPrompt: nil,
                detailTopCastTitle: "Top Casts"),
            font: VideoPlayerFont(
                tableViewCellTitle: tableViewCellTitleFont,
                tableViewCellSubtitle: tableViewCellSubtitle,
                tableViewCellRating: tableViewCellRating,
                tableViewCellDescription: tableViewCellDescription,
                detailTitle: detailTitle,
                detailSubtitle: detailSubtitle,
                detailRating: detailRating,
                detailDescription: detailDescription,
                detailTopCastTitle: detailTopCasts,
                actorListFullname: detailCastsFullname,
                actorListRolename: detailCastsRolename),
            image: VideoPlayerImage(
                likeNormal: heart,
                likeSelected: heart0,
                likeHighlighted: heart0),
            color: VideoPlayerColor(
                navigationBar: MGTemplate.assets.color.navigationBar,
                navigationBarContent: MGTemplate.assets.color.text.navigationBar,
                toolBar: MGTemplate.assets.color.toolBar,
                toolBarContent: MGTemplate.assets.color.text.toolBar,
                view: MGTemplate.assets.color.view,
                viewContent: MGTemplate.assets.color.text.primary,
                tableView: MGTemplate.assets.color.tableView,
                tableViewSeparator: MGTemplate.assets.color.tableViewSeparator,
                refresh: MGTemplate.assets.color.activityIndicator,
                searchBarContent: MGTemplate.assets.color.text.primary,
                tableViewCell: MGTemplate.assets.color.tableViewCell,
                tableViewCellContent: MGTemplate.assets.color.text.primary,
                collectionView: MGTemplate.assets.color.collectionView,
                collectionViewContent: MGTemplate.assets.color.text.primary,
                tableViewCellTitle: MGTemplate.assets.color.text.primary,
                tableViewCellSubtitle: MGTemplate.assets.color.text.secondary,
                tableViewCellRating: MGTemplate.assets.color.text.secondary,
                tableViewCellDescription: MGTemplate.assets.color.text.primary,
                detailTopCastTitle: MGTemplate.assets.color.text.primary),
            data: VideoPlayerData(
                items: list,
                keyboardAppearance: .dark,
                statusBarStyle: .default,
                enableAds: false,
                adsUnitId: "ca-app-pub-3940256099942544/2934735716",
                listRatingStarSize: (ipad ? 24 : 15),
                playerRatingStarSize: ipad ? 24 : 15))
    }
}

struct VideoPlayerAsset: MGVideoPlayerAsset {
    var string: MGVideoPlayerString
    var font: MGVideoPlayerFont
    var image: MGVideoPlayerImage
    var color: MGVideoPlayerColor
    var data: MGVideoPlayerData
}

struct VideoPlayerString: MGVideoPlayerString {
    var title: String
    var navigationBarTitle: String
    var detailTitle: String
    var detailNavigationBarTitle: String
    var searchBarPlaceholder: String
    var navigationListPlayerPrompt: String?
    var navigationVideoPlayerPrompt: String?
    var detailTopCastTitle: String
}

struct VideoPlayerFont: MGVideoPlayerFont {
    var tableViewCellTitle: UIFont?
    var tableViewCellSubtitle: UIFont?
    var tableViewCellRating: UIFont?
    var tableViewCellDescription: UIFont?
    var detailTitle: UIFont?
    var detailSubtitle: UIFont?
    var detailRating: UIFont?
    var detailDescription: UIFont?
    var detailTopCastTitle: UIFont?
    var actorListFullname: UIFont?
    var actorListRolename: UIFont?
}

struct VideoPlayerImage: MGVideoPlayerImage {
    var likeNormal: UIImage
    var likeSelected: UIImage
    var likeHighlighted: UIImage
}

struct VideoPlayerColor: MGVideoPlayerColor {
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
    var tableViewCellTitle: UIColor
    var tableViewCellSubtitle: UIColor
    var tableViewCellRating: UIColor
    var tableViewCellDescription: UIColor
    var detailTopCastTitle: UIColor
}

struct VideoPlayerData: MGVideoPlayerData {
    var items: [MGVideoPlayerItem]?
    var keyboardAppearance: UIKeyboardAppearance
    var statusBarStyle: UIStatusBarStyle
    var enableAds: Bool
    var adsUnitId: String
    var listRatingStarSize: Double
    var playerRatingStarSize: Double
}

fileprivate var list: [MGVideoPlayerItem] {
    var trailerList = [MGVideoPlayerItem]()
    
    let avEndGameTrailer = MGVideoPlayerItem()
    avEndGameTrailer.title = "Avengers: Endgame"
    avEndGameTrailer.description = "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss. It is an adaptation of A Song of Ice and Fire, George R. R. Martin's series of fantasy novels, the first of which is A Game of Thrones. It is filmed in Belfast and elsewhere in Northern Ireland, Canada, Croatia, Iceland, Malta, Morocco, Scotland, Spain, and the United States.[1] The series premiered on HBO in the United States on April 17, 2011, and its seventh season ended on August 27, 2017. The series will conclude with its eighth season premiering on April 14, 2019."
    avEndGameTrailer.pubYear = "24 April 2019"
    avEndGameTrailer.category = "Action, Adventure, Fantasy"
    avEndGameTrailer.starCount = 5
    avEndGameTrailer.reviewCount = 626700
    avEndGameTrailer.actors = [
        MGVideoPlayerActorItem(name: "Robert Downey Jr.", roleName: "Tony Stark", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_SY1000_CR0,0,664,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Chris Evans", roleName: "Captain America", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Mark Ruffalo", roleName: "Hulk", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNDQyNzMzZTMtYjlkNS00YzFhLWFhMTctY2M4YmQ1NmRhODBkXkEyXkFqcGdeQXVyNjcyNzgyOTE@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Chris Hemsworth", roleName: "Thor", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOTU2MTI0NTIyNV5BMl5BanBnXkFtZTcwMTA4Nzc3OA@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Scarlett Johansson", roleName: "Black Widow", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_SY1000_CR0,0,824,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Jeremy Renner", roleName: "Hawkeye", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOTk2NDc2ODgzMF5BMl5BanBnXkFtZTcwMTMzOTQ4Nw@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Don Cheadle", roleName: "War Machine", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNDMxNDM3MzY5N15BMl5BanBnXkFtZTcwMjkzOTY4MQ@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Paul Rudd", roleName: "Ant-Man", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTY4NTEwNDg1MV5BMl5BanBnXkFtZTgwODMwMDA0ODE@._V1_SY1000_CR0,0,799,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Benedict Cumberbatch", roleName: "Doctor Strange", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjE0MDkzMDQwOF5BMl5BanBnXkFtZTgwOTE1Mjg1MzE@._V1_SY1000_CR0,0,690,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Brie Larson", roleName: "Captain Marvel", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjExODkxODU3NF5BMl5BanBnXkFtZTgwNTM0MTk3NjE@._V1_SY1000_CR0,0,721,1000_AL_.jpg")
    ]
    avEndGameTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/%F0%9F%8E%A5%20AVENGERS%204%20ENDGAME%20(2019)%20%20Full%20Movie%20Trailer%20in%20Full%20HD%20%201080p.mp4?raw=true")
    avEndGameTrailer.thumbUrl = URL(string: "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg")
    trailerList.append(avEndGameTrailer)
    
    
    let gotTrailer = MGVideoPlayerItem()
    gotTrailer.title = "Game Of Thrones"
    gotTrailer.description = "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss. It is an adaptation of A Song of Ice and Fire, George R. R. Martin's series of fantasy novels, the first of which is A Game of Thrones. It is filmed in Belfast and elsewhere in Northern Ireland, Canada, Croatia, Iceland, Malta, Morocco, Scotland, Spain, and the United States.[1] The series premiered on HBO in the United States on April 17, 2011, and its seventh season ended on August 27, 2017. The series will conclude with its eighth season premiering on April 14, 2019."
    gotTrailer.pubYear = "TV Series 2011"
    gotTrailer.category = "Action, Adventure, Drama"
    gotTrailer.starCount = 4
    gotTrailer.reviewCount = 66700
    gotTrailer.actors = [
        MGVideoPlayerActorItem(name: "Peter Dinklage", roleName: "Tyrion Lannister", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM1MTI5Mzc0MF5BMl5BanBnXkFtZTYwNzgzOTQz._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Lena Headey", roleName: "Cersei Lannister", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMzIwMjIwNjg0M15BMl5BanBnXkFtZTgwOTI3MDEzMDE@._V1_SY1000_CR0,0,765,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Emilia Clarke", roleName: "Daenerys Targaryen", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNjg3OTg4MDczMl5BMl5BanBnXkFtZTgwODc0NzUwNjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Kit Harington", roleName: "Jon Snow", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTA2NTI0NjYxMTBeQTJeQWpwZ15BbWU3MDIxMjgyNzY@._V1_SY1000_CR0,0,665,1000_AL_.jpg"),
    ]
    gotTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/gameofthrones.mp4?raw=true")
    gotTrailer.thumbUrl = URL(string: "https://www.rollingstone.it/wp-content/uploads/2018/07/daenerys-game-of-thrones-recap.jpg")
    trailerList.append(gotTrailer)
    
    let starWarsTrailer = MGVideoPlayerItem()
    starWarsTrailer.title = "Star Wars: The Force Awakens"
    starWarsTrailer.description = "Star Wars: The Force Awakens (also known as Star Wars: Episode VII – The Force Awakens) is a 2015 American epic space opera film produced, co-written and directed by J. J. Abrams. It is the first installment of the Star Wars sequel trilogy and the seventh installment of the main Star Wars film franchise, following Return of the Jedi (1983). The film stars Harrison Ford, Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong'o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Peter Mayhew, and Max von Sydow, and was produced by Lucasfilm Ltd. and Abrams's production company Bad Robot Productions. The Force Awakens is the first Star Wars film to not involve franchise creator George Lucas. Set 30 years after Return of the Jedi, the film follows Rey, Finn, and Poe Dameron's search for Luke Skywalker and their fight alongside the Resistance, led by General Leia Organa and veterans of the Rebel Alliance, against Kylo Ren and the First Order, a successor to the Galactic Empire."
    starWarsTrailer.pubYear = "16 December 2015"
    starWarsTrailer.category = "Action, Adventure, Fantasy"
    starWarsTrailer.starCount = 4.5
    starWarsTrailer.reviewCount = 770351
    starWarsTrailer.actors = [
        MGVideoPlayerActorItem(name: "Harrison Ford", roleName: "Han Solo", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTY4Mjg0NjIxOV5BMl5BanBnXkFtZTcwMTM2NTI3MQ@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Mark Hamill", roleName: "Luke Skywalker", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOGY2MjI5MDQtOThmMC00ZGIwLWFmYjgtYWU4MzcxOGEwMGVkXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Carrie Fisher", roleName: "Princess Leia", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM4ODU5MDY4MV5BMl5BanBnXkFtZTgwODY1MjQ5MDI@._V1_SY1000_CR0,0,648,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Adam Driver", roleName: "Kylo Ren", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOWViYjUzOWMtMzRkZi00MjNkLTk4M2ItMTVkMDg5MzE2ZDYyXkEyXkFqcGdeQXVyODQwNjM3NDA@._V1_.jpg"),
    ]
    starWarsTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/starwars.mp4?raw=true")
    starWarsTrailer.thumbUrl = URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Video69/v4/e4/3d/a1/e43da14b-0354-62fb-304c-ad53f8ba9fa6/pr_source.lsr/268x0w.png")
    trailerList.append(starWarsTrailer)
    
    let thePunisherTrailer = MGVideoPlayerItem()
    thePunisherTrailer.title = "The Punisher"
    thePunisherTrailer.description = "Marvel's The Punisher, or simply The Punisher, is an American web television series created for Netflix by Steve Lightfoot, based on the Marvel Comics character of the same name. It is set in the Marvel Cinematic Universe (MCU), sharing continuity with the films and other television series of the franchise, and is a spin-off of Marvel's Daredevil. The series is produced by Marvel Television in association with ABC Studios and Bohemian Risk Productions, with Lightfoot serving as showrunner."
    thePunisherTrailer.pubYear = "TV Series (2017– )"
    thePunisherTrailer.category = " Action, Adventure, Crime"
    thePunisherTrailer.starCount = 5
    thePunisherTrailer.reviewCount = 133700
    thePunisherTrailer.actors = [
        MGVideoPlayerActorItem(name: "Jon Bernthal", roleName: "Frank Castle", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTcwNzA5MDg0OV5BMl5BanBnXkFtZTcwMTU2NjE0Nw@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Amber Rose Revah", roleName: "Dinah Madani", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM1ODJhNjgtNGRiMy00YTU1LWIyNTctNDM2ZTliMzdkMDQ4XkEyXkFqcGdeQXVyNzUzNDE1NzM@._V1_SY1000_CR0,0,780,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Ben Barnes", roleName: "Billy Russo", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDkxMjI3MTMtYzM2NS00YjQzLWJkNjQtMzZiYTJmMzlhNDE3XkEyXkFqcGdeQXVyMTg2MTgxNjM@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Jason R. Moore", roleName: "Curtis Hoyle", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDNkMzk4OTMtM2YxNy00MjFjLTgzZjAtMTdhNmQ3YmE2ZDcyXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,848,1000_AL_.jpg"),
    ]
    thePunisherTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/thepunisher.mp4?raw=true")
    thePunisherTrailer.thumbUrl = URL(string: "https://i.redd.it/i4enbn2v5fwz.jpg")
    trailerList.append(thePunisherTrailer)
    
    let interstellarTrailer = MGVideoPlayerItem()
    interstellarTrailer.title = "Interstellar"
    interstellarTrailer.description = "Interstellar is a 2014 epic science fiction thriller film directed, co-written, and co-produced by Christopher Nolan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, and Michael Caine. Set in a dystopian future where humanity is struggling to survive, the film follows a group of astronauts who travel through a wormhole in search of a new home for humanity."
    interstellarTrailer.pubYear = "6 November 2014"
    interstellarTrailer.category = "Adventure, Drama, Sci-Fi"
    interstellarTrailer.starCount = 4
    interstellarTrailer.reviewCount = 1466700
    interstellarTrailer.actors = [
        MGVideoPlayerActorItem(name: "Ellen Burstyn", roleName: "Murph (Older)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTU4MjYxMDc3MF5BMl5BanBnXkFtZTYwNzU3MDIz._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Matthew McConaughey", roleName: "Cooper", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_SY1000_CR0,0,613,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Mackenzie Foy", roleName: "Murph (10 Yrs.)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BYTIyMzExODgtNzllNy00OWQwLTlhM2QtMWU1ZTI2MjgwMTQxXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,714,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "John Lithgow", roleName: "Donald", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQzMzUyNDkzNF5BMl5BanBnXkFtZTcwNTMwNTU5MQ@@._V1_.jpg"),
    ]
    interstellarTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/interstellar.mp4?raw=true")
    interstellarTrailer.thumbUrl = URL(string: "https://pad.mymovies.it/filmclub/2014/01/001/locandina.jpg")
    trailerList.append(interstellarTrailer)
    
    let ironManTrailer = MGVideoPlayerItem()
    ironManTrailer.title = "Iron Man 3"
    ironManTrailer.description = "When Tony Stark's world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution."
    ironManTrailer.pubYear = "24 April 2013"
    ironManTrailer.category = "Action, Adventure, Sci-Fi"
    ironManTrailer.starCount = 4
    ironManTrailer.reviewCount = 66700
    ironManTrailer.actors = [
        MGVideoPlayerActorItem(name: "Robert Downey Jr.", roleName: "Tony Stark", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_SY1000_CR0,0,664,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Gwyneth Paltrow", roleName: "Pepper Potts", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzIxOTQ1NTU1OV5BMl5BanBnXkFtZTcwMTQ4MDY0Nw@@._V1_SY1000_CR0,0,665,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Don Cheadle", roleName: "Colonel James Rhodes", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNDMxNDM3MzY5N15BMl5BanBnXkFtZTcwMjkzOTY4MQ@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Guy Pearce", roleName: "Aldrich Killian", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTgyNzc2NzY3Nl5BMl5BanBnXkFtZTgwNTMzMzAwMjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
    ]
    ironManTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/Iron%20Man%203%20--%20Trailer%20Marvel%20Ufficiale%20%20HD.mp4?raw=true")
    ironManTrailer.thumbUrl = URL(string: "https://img00.deviantart.net/4084/i/2015/286/9/c/ironman_3_digital_painting_by_nununugroho-d9cz9f8.jpg")
    trailerList.append(ironManTrailer)
    
    let fortniteTrailer = MGVideoPlayerItem()
    fortniteTrailer.title = "Fortnite"
    fortniteTrailer.description = "Fortnite is an online video game developed by Epic Games and released in 2017. It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite: Save the World, a cooperative shooter-survival game for up to four players to fight off zombie-like creatures and defend objects with fortifications they can build, Fortnite Battle Royale, a free-to-play battle royale game where up to 100 players fight to be the last person standing, and Fortnite Creative, where players are given complete freedom to create worlds and battle arenas. The first two game modes were released in 2017 as early access titles and Creative was released on December 6, 2018. Save the World is available only for Windows, macOS, PlayStation 4, and Xbox One, while Battle Royale has been released for those platforms in addition for Nintendo Switch, iOS and Android devices."
    fortniteTrailer.pubYear = "21 July 2017"
    fortniteTrailer.category = "Action, Adventure, Comedy | Video Game"
    fortniteTrailer.starCount = 3
    fortniteTrailer.reviewCount = 1700
    fortniteTrailer.actors = [
        MGVideoPlayerActorItem(name: "Adria Arjona", roleName: "Ramirez (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMGNlYTlmNTYtNGViOS00YjJkLWJhODQtNDA1OGFmODc3OGYzXkEyXkFqcGdeQXVyMzg1MzQxODU@._V1_SY1000_CR0,0,668,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "David Boat", roleName: "Kyle (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ1MTk3MTYzOV5BMl5BanBnXkFtZTcwNDM3NjM3Mg@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Ashly Burch", roleName: "Ray (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ5NTA0OTY2Ml5BMl5BanBnXkFtZTgwMDUwNjkwNDE@._V1_SX1777_CR0,0,1777,999_AL_.jpg"),
        MGVideoPlayerActorItem(name: "David Chen", roleName: "(voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDY0MjA1ZDYtYmZiMy00MWQ5LTlmMWItNzM5NTdlZWY5YTM1XkEyXkFqcGdeQXVyMjQwNjQ2NTY@._V1_.jpg")
    ]
    fortniteTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/fortnite.mp4?raw=true")
    fortniteTrailer.thumbUrl = URL(string: "https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Fortnite_image1600w.jpg")
    trailerList.append(fortniteTrailer)
    
    let dragonTrainerTrailer = MGVideoPlayerItem()
    dragonTrainerTrailer.title = "Dragon Trainer"
    dragonTrainerTrailer.description = "How to Train Your Dragon is a 2010 American 3D computer-animated action fantasy film produced by DreamWorks Animation and distributed by Paramount Pictures. Loosely based on the 2003 book of the same name by British author Cressida Cowell, the film was directed by Chris Sanders and Dean DeBlois, the duo who wrote and directed Walt Disney Animation Studios' 2002 film Lilo & Stitch. It stars the voices of Jay Baruchel, Gerard Butler, Craig Ferguson, America Ferrera, Jonah Hill, Christopher Mintz-Plasse, T. J. Miller, and Kristen Wiig."
    dragonTrainerTrailer.pubYear = "26 March 2010"
    dragonTrainerTrailer.category = "Animation, Action, Adventure"
    dragonTrainerTrailer.starCount = 4
    dragonTrainerTrailer.reviewCount = 594700
    dragonTrainerTrailer.actors = [
        MGVideoPlayerActorItem(name: "Jay Baruchel", roleName: "Hiccup (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM5MjY0MzU0OV5BMl5BanBnXkFtZTcwOTE0NDA2NA@@._V1_SY1000_CR0,0,736,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Gerard Butler", roleName: "Stoick (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjE4NDMwMzc4Ml5BMl5BanBnXkFtZTcwMDg4Nzg4Mg@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Craig Ferguson", roleName: "Gobber (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ1NDYxNDM0OF5BMl5BanBnXkFtZTcwNDg4Mjc5Nw@@._V1_SY1000_CR0,0,732,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "America Ferrera", roleName: "Astrid (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQyMDUzOTkxNF5BMl5BanBnXkFtZTcwNjMwNjk0OA@@._V1_SY1000_CR0,0,689,1000_AL_.jpg")
    ]
    dragonTrainerTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/dragontrainer.mp4?raw=true")
    dragonTrainerTrailer.thumbUrl = URL(string: "https://nerdmovieproductions.it/wp-content/uploads/2018/05/Schermata-2018-05-31-alle-17.52.34.png")
    trailerList.append(dragonTrainerTrailer)
    
    let thePrincipleTrailer = MGVideoPlayerItem()
    thePrincipleTrailer.title = "The Principle"
    thePrincipleTrailer.description = "The Principle is a 2014 American independent film produced by Rick DeLano and Robert Sungenis. It rejects the Copernican principle and supports the pseudoscientific,[2] long-superseded notion that Earth is at the center of the Universe. The film is narrated by Kate Mulgrew and features scientists such as Lawrence M. Krauss and Michio Kaku. Mulgrew and scientists who were interviewed in the film have repudiated the ideas advocated in the film and stated that their involvement was the result of being misled by the filmmaker."
    thePrincipleTrailer.pubYear = "24 October 2014"
    thePrincipleTrailer.category = "Documentary, News, Thriller"
    thePrincipleTrailer.starCount = 3.2
    thePrincipleTrailer.reviewCount = 334
    thePrincipleTrailer.actors = [
        MGVideoPlayerActorItem(name: "Michio Kaku", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNTE5ZGM4ZjUtNDk2Ny00NTZlLTk2ODktZWI2MmMxMDVlNWZiL2ltYWdlXkEyXkFqcGdeQXVyNzE5Mjk0NDg@._V1_SY1000_CR0,0,923,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Lawrence Krauss", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM5ODEzNzM0MV5BMl5BanBnXkFtZTgwNTcwODQwMDI@._V1_SY1000_CR0,0,667,1000_AL_.jpg"),
        MGVideoPlayerActorItem(name: "Kate Mulgrew", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOTY1MTc3MjcyNl5BMl5BanBnXkFtZTcwMDg4MDAwMg@@._V1_.jpg"),
        MGVideoPlayerActorItem(name: "Charissa Saverio", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BODc1MDZjNGItOGMyYi00Njg3LThjMDktMDIzYzFiY2U4YjE1XkEyXkFqcGdeQXVyOTAwMDcyMTA@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
    ]
    thePrincipleTrailer.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/thprinciple.mp4?raw=true")
    thePrincipleTrailer.thumbUrl = URL(string: "https://inohment.com/wp-content/uploads/2015/11/thePrinciple_G-.jpg")
    trailerList.append(thePrincipleTrailer)

    return trailerList
}

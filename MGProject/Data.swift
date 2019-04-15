// 
//  Data.swift
//
//  Created by harald bregu on 06/04/2019.
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
import MGVideoPlayerKit

//class VideoData {
//
//    class var items: [MGVideoPlayerData] {
//        var videos = [MGVideoPlayerData]()
//
//        // VIDEO
//        let vid0 = MGVideoPlayerData()
//        vid0.title = "Iron Man 3"
//        vid0.description = "When Tony Stark's world is torn apart by a formidable terrorist called the Mandarin, he starts an odyssey of rebuilding and retribution."
//        vid0.pubYear = "24 April 2013"
//        vid0.category = "Action, Adventure, Sci-Fi"
//        vid0.starCount = 4
//        vid0.reviewCount = 66700
//        vid0.actors = [
//            MGVideoPlayerActorData(name: "Robert Downey Jr.", roleName: "Tony Stark", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_SY1000_CR0,0,664,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Gwyneth Paltrow", roleName: "Pepper Potts", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNzIxOTQ1NTU1OV5BMl5BanBnXkFtZTcwMTQ4MDY0Nw@@._V1_SY1000_CR0,0,665,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Don Cheadle", roleName: "Colonel James Rhodes", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNDMxNDM3MzY5N15BMl5BanBnXkFtZTcwMjkzOTY4MQ@@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Guy Pearce", roleName: "Aldrich Killian", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTgyNzc2NzY3Nl5BMl5BanBnXkFtZTgwNTMzMzAwMjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
//        ]
//        vid0.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/Iron%20Man%203%20--%20Trailer%20Marvel%20Ufficiale%20%20HD.mp4?raw=true")
//        vid0.thumbUrl = URL(string: "https://img00.deviantart.net/4084/i/2015/286/9/c/ironman_3_digital_painting_by_nununugroho-d9cz9f8.jpg")
//
//        // VIDEO
//        let vid3 = MGVideoPlayerData()
//        vid3.title = "Fortnite"
//        vid3.description = "Fortnite is an online video game developed by Epic Games and released in 2017. It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine: Fortnite: Save the World, a cooperative shooter-survival game for up to four players to fight off zombie-like creatures and defend objects with fortifications they can build, Fortnite Battle Royale, a free-to-play battle royale game where up to 100 players fight to be the last person standing, and Fortnite Creative, where players are given complete freedom to create worlds and battle arenas. The first two game modes were released in 2017 as early access titles and Creative was released on December 6, 2018. Save the World is available only for Windows, macOS, PlayStation 4, and Xbox One, while Battle Royale has been released for those platforms in addition for Nintendo Switch, iOS and Android devices."
//        vid3.pubYear = "21 July 2017"
//        vid3.category = "Action, Adventure, Comedy | Video Game"
//        vid3.starCount = 3
//        vid3.reviewCount = 1700
//        vid3.actors = [
//            MGVideoPlayerActorData(name: "Adria Arjona", roleName: "Ramirez (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMGNlYTlmNTYtNGViOS00YjJkLWJhODQtNDA1OGFmODc3OGYzXkEyXkFqcGdeQXVyMzg1MzQxODU@._V1_SY1000_CR0,0,668,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "David Boat", roleName: "Kyle (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ1MTk3MTYzOV5BMl5BanBnXkFtZTcwNDM3NjM3Mg@@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Ashly Burch", roleName: "Ray (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ5NTA0OTY2Ml5BMl5BanBnXkFtZTgwMDUwNjkwNDE@._V1_SX1777_CR0,0,1777,999_AL_.jpg"),
//            MGVideoPlayerActorData(name: "David Chen", roleName: "(voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDY0MjA1ZDYtYmZiMy00MWQ5LTlmMWItNzM5NTdlZWY5YTM1XkEyXkFqcGdeQXVyMjQwNjQ2NTY@._V1_.jpg")
//        ]
//        vid3.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/fortnite.mp4?raw=true")
//        vid3.thumbUrl = URL(string: "https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Fortnite_image1600w.jpg")
//
//        // VIDEO
//        let vid4 = MGVideoPlayerData()
//        vid4.title = "Dragon Trainer"
//        vid4.description = "How to Train Your Dragon is a 2010 American 3D computer-animated action fantasy film produced by DreamWorks Animation and distributed by Paramount Pictures. Loosely based on the 2003 book of the same name by British author Cressida Cowell, the film was directed by Chris Sanders and Dean DeBlois, the duo who wrote and directed Walt Disney Animation Studios' 2002 film Lilo & Stitch. It stars the voices of Jay Baruchel, Gerard Butler, Craig Ferguson, America Ferrera, Jonah Hill, Christopher Mintz-Plasse, T. J. Miller, and Kristen Wiig."
//        vid4.pubYear = "26 March 2010"
//        vid4.category = "Animation, Action, Adventure"
//        vid4.starCount = 4
//        vid4.reviewCount = 594700
//        vid4.actors = [
//            MGVideoPlayerActorData(name: "Jay Baruchel", roleName: "Hiccup (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM5MjY0MzU0OV5BMl5BanBnXkFtZTcwOTE0NDA2NA@@._V1_SY1000_CR0,0,736,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Gerard Butler", roleName: "Stoick (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjE4NDMwMzc4Ml5BMl5BanBnXkFtZTcwMDg4Nzg4Mg@@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Craig Ferguson", roleName: "Gobber (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQ1NDYxNDM0OF5BMl5BanBnXkFtZTcwNDg4Mjc5Nw@@._V1_SY1000_CR0,0,732,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "America Ferrera", roleName: "Astrid (voice)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQyMDUzOTkxNF5BMl5BanBnXkFtZTcwNjMwNjk0OA@@._V1_SY1000_CR0,0,689,1000_AL_.jpg")
//        ]
//        vid4.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/dragontrainer.mp4?raw=true")
//        vid4.thumbUrl = URL(string: "https://nerdmovieproductions.it/wp-content/uploads/2018/05/Schermata-2018-05-31-alle-17.52.34.png")
//
//        // VIDEO
//        let vid5 = MGVideoPlayerData()
//        vid5.title = "The Principle"
//        vid5.description = "The Principle is a 2014 American independent film produced by Rick DeLano and Robert Sungenis. It rejects the Copernican principle and supports the pseudoscientific,[2] long-superseded notion that Earth is at the center of the Universe. The film is narrated by Kate Mulgrew and features scientists such as Lawrence M. Krauss and Michio Kaku. Mulgrew and scientists who were interviewed in the film have repudiated the ideas advocated in the film and stated that their involvement was the result of being misled by the filmmaker."
//        vid5.pubYear = "24 October 2014"
//        vid5.category = "Documentary, News, Thriller"
//        vid5.starCount = 3.2
//        vid5.reviewCount = 334
//        vid5.actors = [
//            MGVideoPlayerActorData(name: "Michio Kaku", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNTE5ZGM4ZjUtNDk2Ny00NTZlLTk2ODktZWI2MmMxMDVlNWZiL2ltYWdlXkEyXkFqcGdeQXVyNzE5Mjk0NDg@._V1_SY1000_CR0,0,923,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Lawrence Krauss", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM5ODEzNzM0MV5BMl5BanBnXkFtZTgwNTcwODQwMDI@._V1_SY1000_CR0,0,667,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Kate Mulgrew", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOTY1MTc3MjcyNl5BMl5BanBnXkFtZTcwMDg4MDAwMg@@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Charissa Saverio", roleName: "Himself", pictureUrl: "https://m.media-amazon.com/images/M/MV5BODc1MDZjNGItOGMyYi00Njg3LThjMDktMDIzYzFiY2U4YjE1XkEyXkFqcGdeQXVyOTAwMDcyMTA@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
//
//        ]
//        vid5.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/thprinciple.mp4?raw=true")
//        vid5.thumbUrl = URL(string: "https://inohment.com/wp-content/uploads/2015/11/thePrinciple_G-.jpg")
//
//        // VIDEO
//        let vid6 = MGVideoPlayerData()
//        vid6.title = "The Punisher"
//        vid6.description = "Marvel's The Punisher, or simply The Punisher, is an American web television series created for Netflix by Steve Lightfoot, based on the Marvel Comics character of the same name. It is set in the Marvel Cinematic Universe (MCU), sharing continuity with the films and other television series of the franchise, and is a spin-off of Marvel's Daredevil. The series is produced by Marvel Television in association with ABC Studios and Bohemian Risk Productions, with Lightfoot serving as showrunner."
//        vid6.pubYear = "TV Series (2017– )"
//        vid6.category = " Action, Adventure, Crime"
//        vid6.starCount = 5
//        vid6.reviewCount = 133700
//        vid6.isFeatured = true
//        vid6.actors = [
//            MGVideoPlayerActorData(name: "Jon Bernthal", roleName: "Frank Castle", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTcwNzA5MDg0OV5BMl5BanBnXkFtZTcwMTU2NjE0Nw@@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Amber Rose Revah", roleName: "Dinah Madani", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM1ODJhNjgtNGRiMy00YTU1LWIyNTctNDM2ZTliMzdkMDQ4XkEyXkFqcGdeQXVyNzUzNDE1NzM@._V1_SY1000_CR0,0,780,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Ben Barnes", roleName: "Billy Russo", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDkxMjI3MTMtYzM2NS00YjQzLWJkNjQtMzZiYTJmMzlhNDE3XkEyXkFqcGdeQXVyMTg2MTgxNjM@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Jason R. Moore", roleName: "Curtis Hoyle", pictureUrl: "https://m.media-amazon.com/images/M/MV5BZDNkMzk4OTMtM2YxNy00MjFjLTgzZjAtMTdhNmQ3YmE2ZDcyXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,848,1000_AL_.jpg"),
//        ]
//        vid6.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/thepunisher.mp4?raw=true")
//        vid6.thumbUrl = URL(string: "https://i.redd.it/i4enbn2v5fwz.jpg")
//
//        // VIDEO
//        let vid7 = MGVideoPlayerData()
//        vid7.title = "Interstellar"
//        vid7.description = "Interstellar is a 2014 epic science fiction thriller film directed, co-written, and co-produced by Christopher Nolan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, and Michael Caine. Set in a dystopian future where humanity is struggling to survive, the film follows a group of astronauts who travel through a wormhole in search of a new home for humanity."
//        vid7.pubYear = "6 November 2014"
//        vid7.category = "Adventure, Drama, Sci-Fi"
//        vid7.starCount = 4
//        vid7.reviewCount = 1466700
//        vid7.isFeatured = true
//        vid7.actors = [
//            MGVideoPlayerActorData(name: "Ellen Burstyn", roleName: "Murph (Older)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTU4MjYxMDc3MF5BMl5BanBnXkFtZTYwNzU3MDIz._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Matthew McConaughey", roleName: "Cooper", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_SY1000_CR0,0,613,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Mackenzie Foy", roleName: "Murph (10 Yrs.)", pictureUrl: "https://m.media-amazon.com/images/M/MV5BYTIyMzExODgtNzllNy00OWQwLTlhM2QtMWU1ZTI2MjgwMTQxXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_SY1000_CR0,0,714,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "John Lithgow", roleName: "Donald", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTQzMzUyNDkzNF5BMl5BanBnXkFtZTcwNTMwNTU5MQ@@._V1_.jpg"),
//        ]
//        vid7.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/interstellar.mp4?raw=true")
//        vid7.thumbUrl = URL(string: "https://pad.mymovies.it/filmclub/2014/01/001/locandina.jpg")
//
//        // VIDEO
//        let vid8 = MGVideoPlayerData()
//        vid8.title = "Game Of Thrones"
//        vid8.description = "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss. It is an adaptation of A Song of Ice and Fire, George R. R. Martin's series of fantasy novels, the first of which is A Game of Thrones. It is filmed in Belfast and elsewhere in Northern Ireland, Canada, Croatia, Iceland, Malta, Morocco, Scotland, Spain, and the United States.[1] The series premiered on HBO in the United States on April 17, 2011, and its seventh season ended on August 27, 2017. The series will conclude with its eighth season premiering on April 14, 2019."
//        vid8.pubYear = "TV Series (2011– )"
//        vid8.category = "Action, Adventure, Drama"
//        vid8.starCount = 4
//        vid8.reviewCount = 66700
//        vid8.actors = [
//            MGVideoPlayerActorData(name: "Peter Dinklage", roleName: "Tyrion Lannister", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTM1MTI5Mzc0MF5BMl5BanBnXkFtZTYwNzgzOTQz._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Lena Headey", roleName: "Cersei Lannister", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMzIwMjIwNjg0M15BMl5BanBnXkFtZTgwOTI3MDEzMDE@._V1_SY1000_CR0,0,765,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Emilia Clarke", roleName: "Daenerys Targaryen", pictureUrl: "https://m.media-amazon.com/images/M/MV5BNjg3OTg4MDczMl5BMl5BanBnXkFtZTgwODc0NzUwNjE@._V1_SY1000_CR0,0,666,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Kit Harington", roleName: "Jon Snow", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTA2NTI0NjYxMTBeQTJeQWpwZ15BbWU3MDIxMjgyNzY@._V1_SY1000_CR0,0,665,1000_AL_.jpg"),
//        ]
//        vid8.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/gameofthrones.mp4?raw=true")
//        vid8.thumbUrl = URL(string: "https://www.rollingstone.it/wp-content/uploads/2018/07/daenerys-game-of-thrones-recap.jpg")
//
//        // VIDEO
//        let vid9 = MGVideoPlayerData()
//        vid9.title = "Star Wars: The Force Awakens"
//        vid9.description = "Star Wars: The Force Awakens (also known as Star Wars: Episode VII – The Force Awakens) is a 2015 American epic space opera film produced, co-written and directed by J. J. Abrams. It is the first installment of the Star Wars sequel trilogy and the seventh installment of the main Star Wars film franchise, following Return of the Jedi (1983). The film stars Harrison Ford, Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong'o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Peter Mayhew, and Max von Sydow, and was produced by Lucasfilm Ltd. and Abrams's production company Bad Robot Productions. The Force Awakens is the first Star Wars film to not involve franchise creator George Lucas. Set 30 years after Return of the Jedi, the film follows Rey, Finn, and Poe Dameron's search for Luke Skywalker and their fight alongside the Resistance, led by General Leia Organa and veterans of the Rebel Alliance, against Kylo Ren and the First Order, a successor to the Galactic Empire."
//        vid9.pubYear = "16 December 2015"
//        vid9.category = "Action, Adventure, Fantasy"
//        vid9.starCount = 4.5
//        vid9.reviewCount = 770351
//        vid9.actors = [
//            MGVideoPlayerActorData(name: "Harrison Ford", roleName: "Han Solo", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMTY4Mjg0NjIxOV5BMl5BanBnXkFtZTcwMTM2NTI3MQ@@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Mark Hamill", roleName: "Luke Skywalker", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOGY2MjI5MDQtOThmMC00ZGIwLWFmYjgtYWU4MzcxOGEwMGVkXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_.jpg"),
//            MGVideoPlayerActorData(name: "Carrie Fisher", roleName: "Princess Leia", pictureUrl: "https://m.media-amazon.com/images/M/MV5BMjM4ODU5MDY4MV5BMl5BanBnXkFtZTgwODY1MjQ5MDI@._V1_SY1000_CR0,0,648,1000_AL_.jpg"),
//            MGVideoPlayerActorData(name: "Adam Driver", roleName: "Kylo Ren", pictureUrl: "https://m.media-amazon.com/images/M/MV5BOWViYjUzOWMtMzRkZi00MjNkLTk4M2ItMTVkMDg5MzE2ZDYyXkEyXkFqcGdeQXVyODQwNjM3NDA@._V1_.jpg"),
//        ]
//        vid9.url = URL(string: "https://github.com/HaraldBregu/General/blob/master/starwars.mp4?raw=true")
//        vid9.thumbUrl = URL(string: "https://is4-ssl.mzstatic.com/image/thumb/Video69/v4/e4/3d/a1/e43da14b-0354-62fb-304c-ad53f8ba9fa6/pr_source.lsr/268x0w.png")
//
//        videos.append(vid8)
//        videos.append(vid9)
//        videos.append(vid6)
//        videos.append(vid7)
//        videos.append(vid0)
//        videos.append(vid3)
//        videos.append(vid4)
//        videos.append(vid5)
//
//        return videos
//    }
//
//}

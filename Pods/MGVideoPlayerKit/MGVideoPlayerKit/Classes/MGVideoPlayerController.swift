// 
//  MGVideoPlayerController.swift
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

import UIKit
import AVKit
import Cosmos
import SDWebImage


public class MGVideoPlayerController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var videoPlayerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var authorsContainers: [UIView]!
    @IBOutlet var authorImagesViews: [UIImageView]!
    @IBOutlet var authorsFullNames: [UILabel]!
    @IBOutlet var authorsRolesNames: [UILabel]!
    @IBOutlet var ratingView: CosmosView!
    @IBOutlet var yearCategory: UILabel!
    @IBOutlet var topCastTitleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    var data:MGVideoPlayerData!
    var item:MGVideoPlayerItem!
    var layout:MGVideoPlayerLayout!

    var isLiked:Bool = false

    override public func viewDidLoad() {
        super.viewDidLoad()

//        title = "mg.videoplayer.nav.title".localized
//        navigationItem.title = "mg.videoplayer.nav.title".localized
//        view.backgroundColor = MGGeneral.View.Theme.dark
        
        authorImagesViews.forEach { (imageView) in
            imageView.layer.cornerRadius = 8
            imageView.layer.maskedCorners = [.layerMinXMinYCorner]
            imageView.clipsToBounds = true
        }
//        authorsFullNames.forEach { $0.font = MGGeneral.Font.bold(size: 9) }
//        authorsRolesNames.forEach { $0.font = MGGeneral.Font.regular(size: 8) }
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: optionImage, style: .plain, target: self, action: #selector(shareMovie))
        
//        videoPlayerView.backgroundColor = MGGeneral.View.Theme.dark
        
//        titleLabel.font = MGGeneral.Font.medium(size: 30)
//        descriptionLabel.font = MGGeneral.Font.light(size: 13)
//        titleLabel.textColor = MGGeneral.Label.Theme.light
//        descriptionLabel.textColor = MGGeneral.Label.Theme.light
        
        // Like button
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .normal)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .highlighted)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .selected)
        
        let player = AVPlayer(url: item.url)
        let playerController = AVPlayerViewController()
        playerController.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerController.player = player
        playerController.view.frame = videoPlayerView.bounds
        addChild(playerController)
        videoPlayerView.addSubview(playerController.view)
        player.play()
        
        titleLabel.text = item.title
        yearCategory.text = item.pubYear + " - " + item.category
        ratingView.settings.updateOnTouch = false
//        ratingView.settings.textFont = MGGeneral.Font.regular(size: 12)!
        ratingView.settings.starSize = 15
        ratingView.settings.starMargin = 2
        ratingView.rating = Double(item.starCount)
        ratingView.text = "(\(String(item.reviewCount)))"
        descriptionLabel.text = item.description
        
        if let actors = item.actors {
            authorImagesViews[0].sd_setShowActivityIndicatorView(true)
            authorImagesViews[0].sd_setIndicatorStyle(.white)
            authorImagesViews[0].sd_setImage(with: URL(string: actors[0].pictureUrl))
            authorsFullNames[0].text = actors[0].name
            authorsRolesNames[0].text = actors[0].roleName
            
            authorImagesViews[1].sd_setShowActivityIndicatorView(true)
            authorImagesViews[1].sd_setIndicatorStyle(.white)
            authorImagesViews[1].sd_setImage(with: URL(string: actors[1].pictureUrl))
            authorsFullNames[1].text = actors[1].name
            authorsRolesNames[1].text = actors[1].roleName
            
            authorImagesViews[2].sd_setShowActivityIndicatorView(true)
            authorImagesViews[2].sd_setIndicatorStyle(.white)
            authorImagesViews[2].sd_setImage(with: URL(string: actors[2].pictureUrl))
            authorsFullNames[2].text = actors[2].name
            authorsRolesNames[2].text = actors[2].roleName
            
            authorImagesViews[3].sd_setShowActivityIndicatorView(true)
            authorImagesViews[3].sd_setIndicatorStyle(.white)
            authorImagesViews[3].sd_setImage(with: URL(string: actors[3].pictureUrl))
            authorsFullNames[3].text = actors[3].name
            authorsRolesNames[3].text = actors[3].roleName
        }

    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction public func like(_ sender: UIButton) {
        isLiked = !isLiked
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .normal)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .highlighted)
//        likeButton.setImage(isLiked ? heartImage : heart0Image, for: .selected)
    }
    
//    private var optionImage:UIImage {
//        let iconOption = IoniconsType.androidMoreVertical
//        let type = FontType.ionicons(iconOption)
//        return UIImage(icon: type, size: CGSize(width: 34, height: 34), textColor: #colorLiteral(red: 0.6666666667, green: 0.6470588235, blue: 0.7098039216, alpha: 1), backgroundColor: .clear)
//    }
//
//    private var heartImage:UIImage {
//        let heartIcon = IoniconsType.iosHeart
//        let icon = FontType.ionicons(heartIcon)
//        return UIImage(icon: icon, size: CGSize(width: 34, height: 34), textColor: secondaryColor)
//    }
//
//    private var heart0Image:UIImage {
//        let heartIcon = IoniconsType.iosHeartOutline
//        let icon = FontType.ionicons(heartIcon)
//        return UIImage(icon: icon, size: CGSize(width: 34, height: 34), textColor: secondaryColor.withAlphaComponent(0.4))
//    }
//
//    private var primaryColor:UIColor {
//        return UIColor("#E21C3A")
//    }
    
    private var secondaryColor:UIColor {
        return UIColor.white
    }
    
    @objc private func shareMovie() {
//        let items = [video.title!, video.description!]
//        let activityIndicator = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        present(activityIndicator, animated: true)
    }

}

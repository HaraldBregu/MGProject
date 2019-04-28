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
import SnapKit
import FirebaseCore
import GoogleMobileAds


public class MGVideoPlayerController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var videoPlayerView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ratingView: CosmosView!
    @IBOutlet var yearCategory: UILabel!
    @IBOutlet var topCastTitleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    
    public var delegate: MGVideoPlayerControllerDelegate?
    public var dataSource: MGVideoPlayerControllerDataSource?
    public var assets: MGVideoPlayerAsset!
    public var item: MGVideoPlayerItem!
    
    var isLiked: Bool = false
    var bannerView: GADBannerView!

    override public func viewDidLoad() {
        super.viewDidLoad()

        title = assets.string.detailTitle
        navigationItem.title = assets.string.detailNavigationBarTitle

        view.backgroundColor = assets.color.view
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.tintColor = assets.color.navigationBarContent
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.prompt = assets.string.navigationVideoPlayerPrompt

        collectionView.backgroundColor = assets.color.collectionView

        if let items = dataSource?.leftBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            navigationItem.leftBarButtonItems = items
            navigationItem.leftItemsSupplementBackButton = true
        }
        
        if let items = dataSource?.rightBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemAction(barButtonItem:)) })
            navigationItem.rightBarButtonItems = items
        }

        let normal = assets.image.likeNormal
        let selected = assets.image.likeSelected
        let image = isLiked ? selected : normal
        likeButton.setImage(image, for: .normal)
        likeButton.setImage(image, for: .highlighted)
        likeButton.setImage(image, for: .selected)

        let player = AVPlayer(url: item.url)
        let playerController = AVPlayerViewController()
        playerController.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerController.player = player
        playerController.view.frame = videoPlayerView.bounds
        addChild(playerController)
        videoPlayerView.addSubview(playerController.view)
        player.play()
        
        titleLabel.text = item.title
        titleLabel.textColor = assets.color.viewContent
        if let font = assets.font.detailTitle {
            titleLabel.font = font
        }
        
        descriptionLabel.text = item.description
        descriptionLabel.textColor = assets.color.viewContent
        if let font = assets.font.detailDescription {
            descriptionLabel.font = font
        }

        yearCategory.text = item.pubYear + " - " + item.category
        yearCategory.textColor = assets.color.viewContent
        if let font = assets.font.detailSubtitle {
            yearCategory.font = font
        }

        ratingView.text = "(\(String(item.reviewCount)))"
        ratingView.settings.textColor = assets.color.viewContent
        if let font = assets.font.detailRating {
            ratingView.settings.textFont = font
        }
        ratingView.settings.updateOnTouch = false
        ratingView.settings.starSize = assets.data.playerRatingStarSize
        ratingView.settings.starMargin = 2
        ratingView.rating = Double(item.starCount)
        
        topCastTitleLabel.text = assets.string.detailTopCastTitle
        topCastTitleLabel.textColor = assets.color.detailTopCastTitle
        if let font = assets.font.detailTopCastTitle {
            topCastTitleLabel.font = font
        }
        
        if let assets = assets, assets.data.enableAds == true, assets.data.adsUnitId.count > 0 {
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            view.addSubview(bannerView)
            bannerView.snp.makeConstraints { make in
                make.bottom.equalTo(self.view)
                make.leading.equalTo(self.view)
                make.trailing.equalTo(self.view)
            }
            bannerView.adUnitID = assets.data.adsUnitId
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            bannerView.delegate = self
        }

    }
    
    @objc func navigationItemAction(barButtonItem: UIBarButtonItem) {
        self.delegate?.controller(self, didTapBarButtonItem: barButtonItem)
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return assets.data.statusBarStyle
    }

    @IBAction func like(_ sender: UIButton) {
        isLiked = !isLiked
        let normal = assets.image.likeNormal
        let selected = assets.image.likeSelected
        let image = isLiked ? selected : normal
        likeButton.setImage(image, for: .normal)
        likeButton.setImage(image, for: .highlighted)
        likeButton.setImage(image, for: .selected)
        likeButton.accessibilityIdentifier = "DETAIL_LIKE"
        self.delegate?.controller(self, didTapButton: sender)
    }
    
}

extension MGVideoPlayerController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.actors.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActorCollectionViewItem", for: indexPath) as? ActorVideoPlayerCollectionViewItem else {
            return ActorVideoPlayerCollectionViewItem()
        }
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        
        let actor = item?.actors[indexPath.item]
        
        cell.authorImageView.sd_setShowActivityIndicatorView(true)
        cell.authorImageView.sd_setIndicatorStyle(.white)
        cell.authorImageView.sd_setImage(with: URL(string: actor?.pictureUrl ?? ""))
        cell.fullname.text = actor?.name
        cell.fullname.textColor = assets.color.collectionViewContent
        if let font = assets.font.actorListFullname {
            cell.fullname.font = font
        }
        cell.rolename.text = actor?.roleName
        cell.rolename.textColor = assets.color.collectionViewContent
        if let font = assets.font.actorListRolename {
            cell.rolename.font = font
        }

        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = (39/70) * height
        let size = CGSize(width: width, height: height)
        return size
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

}

class ActorVideoPlayerCollectionViewItem: UICollectionViewCell {
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var fullname: UILabel!
    @IBOutlet var rolename: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        authorImageView.layer.cornerRadius = 8
        authorImageView.layer.maskedCorners = [.layerMinXMinYCorner]
        authorImageView.clipsToBounds = true
    }

}

extension MGVideoPlayerController: GADBannerViewDelegate {
    
    /// Tells the delegate an ad request loaded an ad.
    public func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        //print("adViewDidReceiveAd")
    }
    
    /// Tells the delegate an ad request failed.
    public func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        //print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    public func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        //print("adViewWillPresentScreen")
    }
    
    /// Tells the delegate that the full-screen view will be dismissed.
    public func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        //print("adViewWillDismissScreen")
    }
    
    /// Tells the delegate that the full-screen view has been dismissed.
    public func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        //print("adViewDidDismissScreen")
    }
    
    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    public func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        //print("adViewWillLeaveApplication")
    }
    
}

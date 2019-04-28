// 
//  MGLandingController.swift
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

import UIKit
import SDWebImage
import SnapKit
import FirebaseCore
import GoogleMobileAds


public class MGLandingController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dividerLineView: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var userSloganLabel: UILabel!
    @IBOutlet var userLikeButton: UIButton!
    @IBOutlet var componentTitleLabel: UILabel!
    @IBOutlet var componentCollectionView: UICollectionView!
    
    public var delegate:MGLandingControllerDelegate!
    public var dataSource:MGLandingControllerDataSource!
    public var assets:MGLandingAsset?
    
    var bannerView: GADBannerView!

    override public func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = assets?.color.backgroundView
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = assets?.color.navigationBar
        navigationController?.navigationBar.tintColor = assets?.color.navigationBarTint
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        if let items = dataSource?.leftBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemMenuAction(barButtonItem:)) })
            navigationItem.leftBarButtonItems = items
        }

        title = assets?.string.navigationTitle
        navigationItem.title = assets?.string.navigationTitle
        
        titleLabel.text = assets?.string.title
        titleLabel.tintColor = assets?.color.primary
        titleLabel.font = assets?.font.title

        descriptionLabel.text = assets?.string.subTitle
        descriptionLabel.tintColor = assets?.color.primary
        descriptionLabel.font = assets?.font.subtitle
        
        userImageView.layer.cornerRadius = 3.0
        userImageView.sd_setShowActivityIndicatorView(true)
        userImageView.sd_setIndicatorStyle(.white)
        userImageView.sd_setImage(with: assets?.data.userImageUrl)
       
        usernameLabel.text = assets?.string.userName
        usernameLabel.tintColor = assets?.color.primary
        usernameLabel.font = assets?.font.username

        userSloganLabel.text = assets?.string.headline
        userSloganLabel.tintColor = assets?.color.primary
        userSloganLabel.font = assets?.font.headline

        userLikeButton.setImage(assets?.image.heart, for: .normal)
        userLikeButton.isSelected = true
        userLikeButton.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        userLikeButton.layer.cornerRadius = userLikeButton.bounds.width/2
        userLikeButton.tintColor = .white

        componentTitleLabel.text = assets?.string.collectionTitle
        componentTitleLabel.textColor = assets?.color.collectionTitle
        componentTitleLabel.font = assets?.font.collectionTitle
        componentCollectionView.showsVerticalScrollIndicator = false
        componentCollectionView.showsHorizontalScrollIndicator = false
        componentCollectionView.backgroundColor = assets?.color.collectionView
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        view.addSubview(bannerView)
        if let assets = assets, assets.data.enableAds == true, assets.data.adsUnitId.count > 0 {
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
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc private func navigationItemMenuAction(barButtonItem: UIBarButtonItem) {
        self.delegate.controller(self, didTapBarButtonItem: barButtonItem)
    }

}

extension MGLandingController {
    
    public static var instance:MGLandingController {
        let podBundle = Bundle(for: MGLandingController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGLandingController else {
            return MGLandingController()
        }
        return controller
    }
    
}

extension MGLandingController: GADBannerViewDelegate {
    
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

extension MGLandingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assets?.data.collectionItems.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MGLandingCollectionCell", for: indexPath) as? MGLandingCollectionCell else {
            return UICollectionViewCell()
        }
        let item = assets?.data.collectionItems[indexPath.item]

        cell.titleLabel.text = item?.title
        cell.titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)        
        cell.backgroundImageView.sd_setShowActivityIndicatorView(true)
        cell.backgroundImageView.sd_setIndicatorStyle(.white)
        cell.backgroundImageView.sd_setImage(with: URL(string: item?.thumbUrl ?? ""))

        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        let width = height * 1.8
        return CGSize(width: width, height: height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
}

class MGLandingCollectionCell: UICollectionViewCell {
    @IBOutlet var containerView: UIView!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerCoverView: UIView!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerCoverView.backgroundColor = .clear
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        gradient.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.01145699098).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.01).cgColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7526981314).cgColor]
        gradient.locations = [0.0, 0.6, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.masksToBounds = true
        containerCoverView.layer.addSublayer(gradient)
        containerCoverView.layer.masksToBounds = true
        containerCoverView.clipsToBounds = true
        containerCoverView.layer.cornerRadius = 1.0
        backgroundImageView.layer.masksToBounds = true
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = 1.0
        containerView.layer.cornerRadius = 1.0
        containerView.layer.masksToBounds = true
    }
    
}

fileprivate let storyboardName = "MGLanding"
fileprivate let controllerIdentifier = "MGLandingController"
fileprivate let resourceName = "MGLandingKit"
fileprivate let resourceExtension = "bundle"

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
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc private func navigationItemMenuAction(barButtonItem: UIBarButtonItem) {
        self.delegate.landingController(self, didTapBarButtonItem: barButtonItem)
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

fileprivate let storyboardName = "MGLanding"
fileprivate let controllerIdentifier = "MGLandingController"
fileprivate let resourceName = "MGLandingKit"
fileprivate let resourceExtension = "bundle"

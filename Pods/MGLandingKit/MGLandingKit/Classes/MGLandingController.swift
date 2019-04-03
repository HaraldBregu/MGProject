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
    
    var data:MGLandingData!
    var items:[MGLandingItemData] = []
    var layout:MGLandingLayout!

    var didTapMenu:((MGLandingController) -> ()) = { _ in }

    override public func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = layout.view.backgroundColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = layout.navigationBar.backgroundColor
        navigationController?.navigationBar.tintColor = layout.navigationBar.tintColor
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: layout.navigationItemMenu.image, style: .plain, target: self, action: #selector(navigationItemMenuAction))

        titleLabel.text = data.title
        titleLabel.tintColor = layout.titleLabel.tintColor
        titleLabel.font = layout.titleLabel.font

        descriptionLabel.text = data.subTitle
        descriptionLabel.tintColor = layout.subTitleLabel.tintColor
        descriptionLabel.font = layout.subTitleLabel.font
        
        userImageView.layer.cornerRadius = 3.0
        userImageView.sd_setShowActivityIndicatorView(true)
        userImageView.sd_setIndicatorStyle(.white)
        userImageView.sd_setImage(with: data.userImageUrl)
       
        usernameLabel.text = data.userName
        usernameLabel.tintColor = layout.usernameLabel.tintColor
        usernameLabel.font = layout.usernameLabel.font
//
        userSloganLabel.text = data.userHeadline
        userSloganLabel.tintColor = layout.headlineLabel.tintColor
        userSloganLabel.font = layout.headlineLabel.font

//        let size = CGSize(width: 20, height: 20)
//        let emptyHeart = UIImage(icon: FontAwesome.heartO, size: size).withRenderingMode(.alwaysTemplate)
//        let fullHeart = UIImage(icon: FontAwesome.heart, size: size).withRenderingMode(.alwaysTemplate)
//        userLikeButton.setImage(fullHeart.tint(with: .red), for: .normal)
        userLikeButton.isSelected = true
        userLikeButton.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        userLikeButton.layer.cornerRadius = userLikeButton.frame.width/2
        userLikeButton.tintColor = .white
        
//        userLikeButton.addAction(for: .touchDown) { [unowned self] in
//            self.userLikeButton.isSelected = !self.userLikeButton.isSelected
//            if self.userLikeButton.isSelected {
//                self.userLikeButton.setImage(fullHeart.tint(with: .red), for: .normal)
//            } else {
//                self.userLikeButton.setImage(emptyHeart.tint(with: .white), for: .normal)
//            }
//        }
        
        componentTitleLabel.text = data.collectionTitle
        componentTitleLabel.textColor = layout.collectionTitleLabel.tintColor
        componentTitleLabel.font = layout.collectionTitleLabel.font
        componentCollectionView.showsVerticalScrollIndicator = false
        componentCollectionView.showsHorizontalScrollIndicator = false
        componentCollectionView.backgroundColor = layout.collectionView.backgroundColor
        
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @objc private func navigationItemMenuAction() {
        
    }
}


extension MGLandingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MGLandingCollectionCell", for: indexPath) as? MGLandingCollectionCell else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.item]

        cell.titleLabel.text = item.title
        cell.titleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)        
        cell.backgroundImageView.sd_setShowActivityIndicatorView(true)
        cell.backgroundImageView.sd_setIndicatorStyle(.white)
        cell.backgroundImageView.sd_setImage(with: URL(string: item.thumbUrl))

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

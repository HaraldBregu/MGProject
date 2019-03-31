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
    
    var dataList:[MGLandingData] = []
    var landingTitle:String!
    var landingSubTitle:String!

    var didTapMenu:((MGLandingController) -> ()) = { _ in }
    var layout:MGLandingLayout!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = MGGeneral.NavBar.Theme.dark
        navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.barTintColor = MGGeneral.NavBar.Theme.dark
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        titleLabel.text = landingTitle
        descriptionLabel.text = landingSubTitle
//        let icon: IoniconsType = IoniconsType.naviconRound
//        let image = UIImage(icon: .ionicons(icon), size: CGSize(width: 34, height: 34), textColor: .white, backgroundColor: .clear)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(revealMenuViewcontroller))
        
        userImageView.layer.cornerRadius = 3.0
        userImageView.sd_setShowActivityIndicatorView(true)
        userImageView.sd_setIndicatorStyle(.white)
        userImageView.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/megageneral-8d8a3.appspot.com/o/MGIconLight.png?alt=media&token=b8bb255f-7ede-4b54-a8c0-b3a63ad661f6"))
        
        
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
        
//        componentTitleLabel.text = "mg.megageneral.componentcollection.title".localized
        componentCollectionView.showsVerticalScrollIndicator = false
        componentCollectionView.showsHorizontalScrollIndicator = false
//        componentCollectionView.backgroundColor = MGGeneral.NavBar.Theme.dark
        
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
    
}


extension MGLandingController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MGLandingCollectionCell", for: indexPath) as? MGLandingCollectionCell else {
            return UICollectionViewCell()
        }
        let item = dataList[indexPath.item]

        cell.titleLabel.text = item.title
//        cell.titleLabel.font = MGGeneral.Font.regular(size: 12.0)

        cell.backgroundImageView.sd_setShowActivityIndicatorView(true)
        cell.backgroundImageView.sd_setIndicatorStyle(.white)
        cell.backgroundImageView.sd_setImage(with: URL(string: item.thumbUrl))

        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: collectionView.bounds.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
}

// 
//  MGAudioPlayerListController.swift
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


public class MGAudioPlayerListController: UIViewController {
    @IBOutlet var tableView: UITableView!
    public var delegate: MGAudioPlayerControllerDelegate?
    public var dataSource: MGAudioPlayerControllerDataSource?
    public var assets: MGAudioPlayerAsset!

    var searchController:UISearchController!
    var filteredAudios = [MGAudioPlayerItem]()
    var bannerView: GADBannerView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = assets.string.title
        view.backgroundColor = assets.color.view
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.tintColor = assets.color.navigationBarContent
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false

        definesPresentationContext = true
        navigationItem.prompt = assets.string.navigationListPlayerPrompt
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = assets.string.searchBarPlaceholder
        searchController.searchBar.tintColor = assets.color.searchBarContent
        searchController.searchBar.keyboardAppearance = assets.data.darkKeyboard ? .dark : .light
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = assets.string.navigationBarTitle

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
        
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 112 + 25, bottom: 0, right: 0)
        tableView.backgroundColor = assets.color.tableView
        tableView.separatorColor = assets.color.tableViewSeparator
        
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

}

extension MGAudioPlayerListController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let items = assets.data.items ?? []
        return isFiltering ? filteredAudios.count : items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MGAudioPlayerListCell") as? MGAudioPlayerListCell else {
            return UITableViewCell()
        }
        let items = assets.data.items ?? []
        let audio = isFiltering ? filteredAudios[indexPath.row] : items[indexPath.row]
        
        cell.backgroundColor = assets.color.tableViewCell
        cell.contentView.backgroundColor = assets.color.tableViewCell

        cell.songImageView.sd_setShowActivityIndicatorView(true)
        cell.songImageView.sd_setIndicatorStyle(.white)
        cell.songImageView.sd_setImage(with: URL(string: audio.thumbUrlString))

        cell.titleLabel.text = audio.title
        cell.titleLabel.textColor = assets.color.tableViewCellContent
        if let font = assets.font.tableViewCellTitle {
            cell.titleLabel.font = font
        }
        
        cell.authorLabel.text = audio.author
        cell.authorLabel.textColor = assets.color.tableViewCellContent
        if let font = assets.font.tableViewCellSubtitle {
            cell.authorLabel.font = font
        }
        
        cell.optionButton.setImage(assets.image.tableViewCellIcon, for: .normal)
        cell.optionButton.setImage(assets.image.tableViewCellIcon, for: .highlighted)
        cell.optionButton.setImage(assets.image.tableViewCellIcon, for: .selected)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = _storyboard.instantiateViewController(withIdentifier: "MGAudioPlayerController") as! MGAudioPlayerController
        let items = assets.data.items ?? []
        let item = isFiltering ? filteredAudios[indexPath.row] : items[indexPath.row]
        controller.item = item
        controller.assets = assets
        controller.delegate = delegate
        controller.dataSource = dataSource
        navigationController?.pushViewController(controller, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }
        
        if cell.responds(to: #selector(setter: UITableViewCell.preservesSuperviewLayoutMargins)) {
            cell.preservesSuperviewLayoutMargins = false
        }
    }
}

extension MGAudioPlayerListController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

extension MGAudioPlayerListController {
    
    private var _storyboard: UIStoryboard {
        let podBundle = Bundle(for: MGAudioPlayerListController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard
    }
    
    public static var instance: MGAudioPlayerListController {
        let podBundle = Bundle(for: MGAudioPlayerListController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGAudioPlayerListController else {
            return MGAudioPlayerListController()
        }
        return controller
    }

    private var isFiltering:Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private var searchBarIsEmpty:Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        let items = assets.data.items ?? []
        filteredAudios = items.filter({( item : MGAudioPlayerItem) -> Bool in
            return item.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}

class MGAudioPlayerListCell: UITableViewCell {
    @IBOutlet var songImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var optionButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        songImageView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == .pad ? 7 : 1
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

fileprivate let storyboardName = "MGAudioPlayer"
fileprivate let controllerIdentifier = "MGAudioPlayerListController"
fileprivate let resourceName = "MGAudioPlayerKit"
fileprivate let resourceExtension = "bundle"

extension MGAudioPlayerListController: GADBannerViewDelegate {
    
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

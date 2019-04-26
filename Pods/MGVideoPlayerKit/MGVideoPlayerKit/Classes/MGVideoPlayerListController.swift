// 
//  MGVideoPlayerListController.swift
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

import Foundation
import AVKit
import SDWebImage
import Cosmos


public class MGVideoPlayerListController:UIViewController {
    @IBOutlet var tableView: UITableView!
    public var delegate: MGVideoPlayerControllerDelegate?
    public var dataSource: MGVideoPlayerControllerDataSource?
    public var assets: MGVideoPlayerAsset!

    var searchController: UISearchController!
    var filteredItems = [MGVideoPlayerItem]()

    public override func viewDidLoad() {
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
        navigationItem.largeTitleDisplayMode = .always
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
    }
    
    @objc func navigationItemAction(barButtonItem: UIBarButtonItem) {
        self.delegate?.controller(self, didTapBarButtonItem: barButtonItem)
    }

    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var refreshControl:UIRefreshControl {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }
    
}

extension MGVideoPlayerListController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataCount = assets.data.items?.count ?? 0
        return isFiltering ? filteredItems.count : dataCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MGVideoPlayerListCell") as? MGVideoPlayerListCell else {
            return UITableViewCell()
        }
        let items = assets.data.items ?? []
        let video = isFiltering ? filteredItems[indexPath.row] : items[indexPath.row]
//        cell.isFeatured = video.isFeatured

        cell.backgroundColor = assets.color.tableViewCell
        cell.contentView.backgroundColor = assets.color.tableViewCell
     
        cell.thumbImageView.sd_setShowActivityIndicatorView(true)
        cell.thumbImageView.sd_setIndicatorStyle(.white)
        cell.thumbImageView.sd_setImage(with: video.thumbUrl)

        cell.titleLabel.text = video.title
        cell.titleLabel.textColor = assets.color.tableViewCellContent
        if let font = assets.font.tableViewCellTitle {
            cell.titleLabel.font = font
        }
        
        cell.descriptionLabel.text = video.description
        cell.descriptionLabel.textColor = assets.color.tableViewCellContent
        if let font = assets.font.tableViewCellDescription {
            cell.descriptionLabel.font = font
        }

        cell.yearCategory.text = video.pubYear + " - " + video.category
        cell.yearCategory.textColor = assets.color.tableViewCellContent
        if let font = assets.font.tableViewCellSubtitle {
            cell.yearCategory.font = font
        }

        cell.ratingView.rating = video.starCount
        cell.ratingView.text = String(video.reviewCount)
        if let font = assets.font.tableViewCellRating {
            cell.ratingView.settings.textFont = font
        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let items = assets.data.items ?? []
        let item = isFiltering ? filteredItems[indexPath.row] : items[indexPath.row]
        guard let controller = _storyboard.instantiateViewController(withIdentifier: "MGVideoPlayerController") as? MGVideoPlayerController else { return }
        controller.item = item
        controller.assets = assets
        controller.delegate = delegate
        controller.dataSource = dataSource
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension MGVideoPlayerListController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

extension MGVideoPlayerListController: AVPlayerViewControllerDelegate {
    
    public func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        
    }
}

extension MGVideoPlayerListController {
    
    private var _storyboard: UIStoryboard {
        let podBundle = Bundle(for: MGVideoPlayerListController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard
    }
    
    public static var instance: MGVideoPlayerListController {
        let podBundle = Bundle(for: MGVideoPlayerListController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGVideoPlayerListController else {
            return MGVideoPlayerListController()
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
        filteredItems = items.filter({( video : MGVideoPlayerItem) -> Bool in
            return video.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}

class MGVideoPlayerListCell: UITableViewCell {
    @IBOutlet var thumbImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearCategory: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ratingView.settings.updateOnTouch = false
        ratingView.settings.starSize = 15
        ratingView.settings.starMargin = 2
        thumbImageView.layer.cornerRadius = 5
        thumbImageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

fileprivate let storyboardName = "MGVideoPlayer"
fileprivate let controllerIdentifier = "MGVideoPlayerListController"
fileprivate let resourceName = "MGVideoPlayerKit"
fileprivate let resourceExtension = "bundle"

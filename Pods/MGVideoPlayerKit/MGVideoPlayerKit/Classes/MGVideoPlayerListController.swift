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


public class MGVideoPlayerListController:UIViewController {
    @IBOutlet var tableView: UITableView!
    private var searchController:UISearchController!
    
    var data:MGVideoPlayerData!
    var items:[MGVideoPlayerItem]!
    var layout:MGVideoPlayerLayout!
    
    var filteredItems = [MGVideoPlayerItem]()
    
    var didTapNavigationItem:((MGVideoPlayerListController, UIBarButtonItem) -> ())!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = layout.view.backgroundColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = layout.navigationBar.backgroundColor
        navigationController?.navigationBar.tintColor = layout.navigationBar.tintColor
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: layout.navigationItemMenu.image, style: .plain, target: self, action: #selector(navigationItemMenuAction(barButtonItem:)))
        
        title = data.title
        navigationItem.title = data.title

        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = data.searchBarPlaceholder
        searchController.searchBar.tintColor = layout.searchBar.tintColor
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.backgroundColor = layout.tableView.backgroundColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 112 + 25, bottom: 0, right: 0)
        tableView.separatorColor = layout.tableView.separatorColor
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var refreshControl:UIRefreshControl {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }
    
    @objc private func navigationItemMenuAction(barButtonItem: UIBarButtonItem) {
        didTapNavigationItem(self, barButtonItem)
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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

extension MGVideoPlayerListController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension MGVideoPlayerListController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredItems.count : items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MGVideoPlayerListCell") as? MGVideoPlayerListCell else {
            return UITableViewCell()
        }
        
        let video = isFiltering ? filteredItems[indexPath.row] : items[indexPath.row]

        cell.backgroundColor = layout.tableViewCell.backgroundColor
        cell.contentView.backgroundColor = layout.tableViewCell.backgroundColor
//        cell.ratingView.settings.textFont = layout.tableViewCellRatingLabel.font
        
        cell.isFeatured = video.isFeatured
        
        cell.titleLabel.text = video.title
        cell.descriptionLabel.text = video.description
        
        cell.thumbImageView.sd_setShowActivityIndicatorView(true)
        cell.thumbImageView.sd_setIndicatorStyle(.white)
        cell.thumbImageView.sd_setImage(with: video.thumbUrl)
        
        cell.titleLabel.textColor = layout.tableViewCellTitleLabel.tintColor
        cell.descriptionLabel.textColor = layout.tableViewCellSubtitleLabel.tintColor
        
        cell.yearCategory.text  = video.pubYear + " - " + video.category
        
        cell.ratingView.rating = video.starCount
        cell.ratingView.text = String(video.reviewCount)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = isFiltering ? filteredItems[indexPath.row] : items[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "MGVideoPlayerController") as! MGVideoPlayerController
        controller.item = item
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension MGVideoPlayerListController: AVPlayerViewControllerDelegate {
    
    public func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        
    }
}

extension MGVideoPlayerListController {
    
    private var isFiltering:Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private var searchBarIsEmpty:Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredItems = items.filter({( video : MGVideoPlayerItem) -> Bool in
            return video.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}

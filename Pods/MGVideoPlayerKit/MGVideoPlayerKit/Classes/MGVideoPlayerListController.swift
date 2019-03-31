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

/// :nodoc:
public class MGVideoPlayerListController:UIViewController {
    @IBOutlet var tableView: UITableView!
    private var searchController:UISearchController!
    public var videoDataList = [MGVideoPlayerData]()
    private var filteredVideos = [MGVideoPlayerData]()
    var didTapMenu:((MGVideoPlayerListController) -> ()) = { _ in }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "mg.videoplayerlist.nav.title".localized
//        navigationItem.title = "mg.videoplayerlist.nav.title".localized
//        view.backgroundColor = MGGeneral.View.Theme.dark
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = MGGeneral.NavBar.Theme.dark
//        navigationController?.navigationBar.tintColor = MGGeneral.NavBar.Theme.light
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
//        let icon: IoniconsType = IoniconsType.naviconRound
//        let image = UIImage(icon: .ionicons(icon), size: CGSize(width: 34, height: 34), textColor: .white)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(revealMenuViewcontroller))
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "mg.videoplayerlist.nav.search.title".localized
//        searchController.searchBar.tintColor = MGGeneral.NavBar.Theme.light
        
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
//        tableView.backgroundColor = MGGeneral.View.Theme.dark
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 112 + 25, bottom: 0, right: 0)
//        tableView.separatorColor = MGGeneral.View.Theme.light

    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private var refreshControl:UIRefreshControl {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }
    
    @objc private func revealMenuViewcontroller() {
        didTapMenu(self)
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


/// :nodoc:
extension MGVideoPlayerListController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

/// :nodoc:
extension MGVideoPlayerListController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredVideos.count : videoDataList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MGVideoPlayerListCell") as? MGVideoPlayerListCell else {
            return UITableViewCell()
        }
//        cell.backgroundColor = MGGeneral.View.Theme.dark
//        cell.contentView.backgroundColor = MGGeneral.View.Theme.dark
        
        let video = isFiltering ? filteredVideos[indexPath.row] : videoDataList[indexPath.row]
        
        cell.isFeatured = video.isFeatured
        
        cell.titleLabel.text = video.title
        cell.descriptionLabel.text = video.description
        
        cell.thumbImageView.sd_setShowActivityIndicatorView(true)
        cell.thumbImageView.sd_setIndicatorStyle(.white)
        cell.thumbImageView.sd_setImage(with: video.thumbUrl)
        
//        cell.titleLabel.textColor = MGGeneral.Label.Theme.light
//        cell.descriptionLabel.textColor = MGGeneral.Label.Theme.light
        
        cell.yearCategory.text  = video.pubYear + " - " + video.category
        
        cell.ratingView.rating = video.starCount
        cell.ratingView.text = "(\(String(video.reviewCount)))"
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoData = isFiltering ? filteredVideos[indexPath.row] : videoDataList[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "MGVideoPlayerController") as! MGVideoPlayerController
        controller.videoData = videoData
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

/// :nodoc:
extension MGVideoPlayerListController: AVPlayerViewControllerDelegate {
    
    public func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        
    }
}

/// :nodoc:
extension MGVideoPlayerListController {
    
    private var isFiltering:Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private var searchBarIsEmpty:Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredVideos = videoDataList.filter({( video : MGVideoPlayerData) -> Bool in
            return video.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
}

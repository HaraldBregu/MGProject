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

public class MGAudioPlayerListController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var searchController:UISearchController!
    var filteredAudios = [MGAudioPlayerData]()
    var audios:[MGAudioPlayerData] {
        return AudioData.items
    }
    var didTapMenu:((MGAudioPlayerListController) -> ()) = { _ in }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
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
//        searchController.searchBar.placeholder = "mg.audioplayerlist.nav.search.title".localized
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
        tableView.separatorColor = #colorLiteral(red: 0.1254901961, green: 0.1294117647, blue: 0.1529411765, alpha: 1)
        tableView.separatorStyle = .singleLine
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
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc private func revealMenuViewcontroller() {
        didTapMenu(self)
    }

}

/// :nodoc:
extension MGAudioPlayerListController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

/// :nodoc:
extension MGAudioPlayerListController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredAudios.count : audios.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MGAudioPlayerListCell") as? MGAudioPlayerListCell else {
            return UITableViewCell()
        }
        
        let audio = isFiltering ? filteredAudios[indexPath.row] : audios[indexPath.row]
        
//        cell.backgroundColor = MGGeneral.View.Theme.dark
//        cell.contentView.backgroundColor = MGGeneral.View.Theme.dark
        
        cell.titleLabel.text = audio.title
        cell.authorLabel.text = audio.author
        
        cell.songImageView.sd_setShowActivityIndicatorView(true)
        cell.songImageView.sd_setIndicatorStyle(.white)
        cell.songImageView.sd_setImage(with: URL(string: audio.thumbUrlString))
        
        cell.optionButton.setImage(optionImage, for: .normal)
        cell.optionButton.setImage(optionImage, for: .highlighted)
        cell.optionButton.setImage(optionImage, for: .selected)
        
//        cell.optionButton.removeAction(for: .touchUpInside)
//        cell.optionButton.addAction(for: .touchUpInside) { [unowned self] in
//            let items = [audio.title!, audio.author!, audio.thumbUrlString!]
//            let activityIndicator = UIActivityViewController(activityItems: items, applicationActivities: nil)
//            self.present(activityIndicator, animated: true)
//        }
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MGAudioPlayerController") as! MGAudioPlayerController
        controller.currentAudio = isFiltering ? filteredAudios[indexPath.row] : audios[indexPath.row]
        controller.audios = audios
        navigationController?.pushViewController(controller, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableCell(withIdentifier: "MGAudioPlayerListHeaderCell") as? MGAudioPlayerListHeaderCell else {
            return UITableViewCell()
        }
        
//        headerView.backgroundColor = MGGeneral.View.Theme.dark
//        headerView.contentView.backgroundColor = MGGeneral.View.Theme.dark
//        headerView.titleLabel.text = "mg.audioplayerlist.table.header.title".localized
//        headerView.titleLabel.font = MGGeneral.Font.light(size: 15.0)
//        headerView.titleLabel.textColor = MGGeneral.Label.Theme.light
        
        return headerView
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
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

/// :nodoc:
extension MGAudioPlayerListController {
    
    private var isFiltering:Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private var searchBarIsEmpty:Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredAudios = audios.filter({( aud : MGAudioPlayerData) -> Bool in
            return aud.title.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    private var optionSize:CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    private var optionImage:UIImage {
        return UIImage()
    }
//    private var optionImage:UIImage {
////        let iconOption = IoniconsType.androidMoreVertical
////        let type = FontType.ionicons(iconOption)
//        return UIImage(icon: type, size: optionSize, textColor: #colorLiteral(red: 0.6666666667, green: 0.6470588235, blue: 0.7098039216, alpha: 1), backgroundColor: .clear)
//    }
    
    private var secondaryColor:UIColor {
        return UIColor.white
    }
    
}

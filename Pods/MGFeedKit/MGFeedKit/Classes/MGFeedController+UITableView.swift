// 
//  MGFeedController+UITableView.swift
//
//  Created by harald bregu on 01/03/2019.
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

/// :nodoc:
extension MGFeedController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filterFeedDataItems.count : feedDataItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MGFeedViewCell") as? MGFeedViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        let feedItem = isFiltering ? filterFeedDataItems[indexPath.row] : feedDataItems[indexPath.row]
        
        cell.itemImageView.sd_setShowActivityIndicatorView(true)
        cell.itemImageView.sd_setIndicatorStyle(.white)
        cell.itemImageView.sd_setImage(with: URL(string: feedItem.imageUrl))
        
        cell.itemTitleLabel.text = feedItem.title
//        cell.itemDescriptionContentLabel.text = feedItem.itemDescription.byConvertingHTMLToPlainText()
        
        cell.layoutIfNeeded()
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "MGFeedDetailController") as? MGFeedDetailController {
            let feedDataItem = isFiltering ? filterFeedDataItems[indexPath.row] : feedDataItems[indexPath.row]
            controller.feedDataItem = feedDataItem
            controller.title = title
            controller.navigationItem.title = navigationItem.title
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}

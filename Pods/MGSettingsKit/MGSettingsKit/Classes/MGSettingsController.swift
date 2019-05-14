// 
//  MGSettingsController.swift
//
//  Created by harald bregu on 10/05/2019.
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


public class MGSettingsController: UIViewController {
    @IBOutlet var tableView: UITableView!
    public var delegate: MGSettingsControllerDelegate?
    public var dataSource: MGSettingsControllerDataSource?
    public var assets: MGSettingsAsset!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        title = assets.string.title
        navigationItem.title = assets.string.navigationTitle
        
        view.backgroundColor = assets.color.viewPrimary
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.tintColor = assets.color.navigationBarContent
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        
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
        tableView.backgroundColor = assets.color.viewPrimary
        tableView.separatorColor = assets.color.viewTertiary
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
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
    }
    
    @objc private func navigationItemAction(barButtonItem: UIBarButtonItem) {
        self.delegate?.controller(self, didTapBarButtonItem: barButtonItem)
    }
    
}

extension MGSettingsController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return assets.data.items.group(by: { $0.section.identifier }).count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = assets.data.items.group(by: { $0.section.identifier })
        return sections[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MGSettingsCellDefault") as? MGSettingsCell
        
        let sections = assets.data.items.group(by: { $0.section.identifier })
        let item = sections[indexPath.section][indexPath.row]
        
        cell?.backgroundColor = assets.color.viewSecondary
        cell?.contentView.backgroundColor = assets.color.viewSecondary

        cell?.primaryImageView?.isHidden = true
        cell?.subtitleLabel?.isHidden = true
        cell?.switchControl?.isHidden = true
        cell?.indicatorImageView?.isHidden = true
        cell?.sliderContainerView?.isHidden = true

        cell?.titleLabel.text = item.title
        cell?.titleLabel.textColor = assets.color.textPrimary
        
        cell?.subtitleLabel?.text = item.subtitle
        cell?.subtitleLabel?.isHidden = item.subtitle == nil
        cell?.subtitleLabel?.textColor = assets.color.textSecondary

        cell?.primaryImageView?.image = item.primaryImage
        cell?.primaryImageView?.isHidden = item.primaryImage == nil
        
        cell?.indicatorImageView?.image = item.indicatorImage
        cell?.indicatorImageView?.isHidden = item.indicatorImage == nil
        
        if let `switch` = item.switch {
            cell?.switchControl?.isHidden = false
            cell?.switchControl?.isOn = `switch`.state
            cell?.switchControl?.onTintColor = assets.color.controlPrimary
            cell?.switchControl?.tintColor = assets.color.controlSecondary
            cell?.switchControl?.thumbTintColor = assets.color.controlContent
            cell?.switchControl?.indexPath = indexPath
            cell?.switchControl?.addTarget(self, action: #selector(`switch`(sender:)), for: .valueChanged)
        }

        cell?.sliderMinImageView?.isHidden = true
        cell?.sliderMaxImageView?.isHidden = true
        if let slider = item.slider {
            cell?.sliderContainerView?.isHidden = false
            cell?.sliderControl?.isHidden = false
            cell?.sliderMinImageView?.isHidden = false
            cell?.sliderMaxImageView?.isHidden = false
            cell?.sliderControl?.value = slider.value
            cell?.sliderControl?.minimumValue = slider.minValue
            cell?.sliderControl?.maximumValue = slider.maxValue
            cell?.sliderControl?.minimumTrackTintColor = assets.color.controlPrimary
            cell?.sliderControl?.maximumTrackTintColor = assets.color.controlSecondary
            cell?.sliderMinImageView?.isHidden = slider.minImage == nil
            cell?.sliderMaxImageView?.isHidden = slider.maxImage == nil
            cell?.sliderMinImageView?.image = slider.minImage
            cell?.sliderMaxImageView?.image = slider.maxImage
            cell?.sliderControl?.indexPath = indexPath
            cell?.sliderControl?.addTarget(self, action: #selector(slide(sender:)), for: .valueChanged)
        }

        return cell ?? MGSettingsCell()
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let item = assets.data.items.group(by: { $0.section.identifier })[section].first
        return item?.section.headerTitle
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let item = assets.data.items.group(by: { $0.section.identifier })[section].first
        return item?.section.footerTitle
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = assets.data.items.group(by: { $0.section.identifier })
        let item = sections[indexPath.section][indexPath.row]
        self.delegate?.controller(self, didSelectItem: item)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let currentCell = cell as? MGSettingsCell else { return }

        if currentCell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            currentCell.separatorInset.left = 15
            if currentCell.primaryImageView?.isHidden == false {
                let width = currentCell.primaryImageView?.image?.size.width ?? 0
                currentCell.separatorInset.left =  width + 30
            }
        }
        
        if currentCell.responds(to: #selector(setter: UIView.layoutMargins)) {
            currentCell.layoutMargins.left = 15
            if currentCell.primaryImageView?.isHidden == false {
                let width = currentCell.primaryImageView?.image?.size.width ?? 0
                currentCell.layoutMargins.left =  width + 30
            }
        }

        if currentCell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
            currentCell.preservesSuperviewLayoutMargins = false
        }
     }
    
    @objc func `switch`(sender: UISwitch)  {
        let sections = assets.data.items.group(by: { $0.section.identifier })
        let item = sections[sender.indexPath.section][sender.indexPath.row]
        item.switch?.state = sender.isOn
        self.delegate?.controller(self, didSelectItem: item)
    }
    
    @objc func slide(sender: UISlider)  {
        let sections = assets.data.items.group(by: { $0.section.identifier })
        let item = sections[sender.indexPath.section][sender.indexPath.row]
        item.slider?.value = sender.value
        self.delegate?.controller(self, didSelectItem: item)
    }

}

public class MGSettingsCell: UITableViewCell {
    @IBOutlet public var primaryImageView: UIImageView?
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var subtitleLabel: UILabel?
    @IBOutlet public var indicatorImageView: UIImageView?
    @IBOutlet public var switchControl: UISwitch?
    @IBOutlet public var sliderContainerView: UIStackView?
    @IBOutlet public var sliderMinImageView: UIImageView?
    @IBOutlet public var sliderMaxImageView: UIImageView?
    @IBOutlet public var sliderControl: UISlider?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
       
        primaryImageView?.layer.cornerRadius = 3
        primaryImageView?.clipsToBounds = true

        primaryImageView?.isHidden = true
        subtitleLabel?.isHidden = true
        indicatorImageView?.isHidden = true
        switchControl?.isHidden = true
        sliderContainerView?.isHidden = true
        sliderMinImageView?.isHidden = true
        sliderMaxImageView?.isHidden = true
        sliderControl?.isHidden = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

fileprivate let storyboardName          = "MGSettings"
fileprivate let controllerIdentifier    = "MGSettingsController"
fileprivate let resourceName            = "MGSettingsKit"
fileprivate let resourceExtension       = "bundle"

extension MGSettingsController {
    
    public static var instance: MGSettingsController {
        let podBundle = Bundle(for: MGSettingsController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGSettingsController else {
            return MGSettingsController()
        }
        return controller
    }
    
}

public protocol MGSettingsControllerDataSource {
    func leftBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem]
    func rightBarButtonItems(_ controller: UIViewController) -> [UIBarButtonItem]
}

public protocol MGSettingsControllerDelegate {
    func controller(_ controller: UIViewController, didTapBarButtonItem barButtonItem: UIBarButtonItem)
    func controller(_ controller: UIViewController, didSelectItem item: MGSettingsItem)
}

extension Array {
    func group<U: Hashable>(by key: (Element) -> U) -> [[Element]] {
        var indexKeys = [U : Int]()
        var grouped = [[Element]]()
        for element in self {
            let key = key(element)
            if let ind = indexKeys[key] {
                grouped[ind].append(element)
            } else {
                grouped.append([element])
                indexKeys[key] = grouped.count - 1
            }
        }
        return grouped
    }
}

extension UIView {
    private static var _myComputedProperty = [String: IndexPath]()
    var indexPath: IndexPath {
        get {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            return UIView._myComputedProperty[tmpAddress] ?? IndexPath()
        }
        set(newValue) {
            let tmpAddress = String(format: "%p", unsafeBitCast(self, to: Int.self))
            UIView._myComputedProperty[tmpAddress] = newValue
        }
    }
}

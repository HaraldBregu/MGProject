// 
//  MGTextController.swift
//
//  Created by harald bregu on 31/08/2019.
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


public class MGTextData {
    var type: MGTextDataType!
    public init(type: MGTextDataType) {
        self.type = type
    }
}

public enum MGTextDataType {
    case text(_ string: String)
    case attributed(_ string: NSAttributedString)
    case plain(filename: String, fileExtension: String)
    case rtf(filename: String, fileExtension: String)
    case html(filename: String, fileExtension: String)
}

public class MGTextController: UIViewController {
    @IBOutlet public weak var textView: UITextView!
  
    public var leftBarButtonItems: (() -> [UIBarButtonItem])? {
        didSet {
            if let leftItems = leftBarButtonItems {
                navigationItem.leftBarButtonItems = leftItems()
                navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    public var rightBarButtonItems: (() -> [UIBarButtonItem])? {
        didSet {
            if let rightItems = rightBarButtonItems {
                navigationItem.rightBarButtonItems = rightItems()
            }
        }
    }
    
    public var textData: (() -> (MGTextData))?

    public var assets: MGTextAsset!

    override public func viewDidLoad() {
        super.viewDidLoad()

        title = assets.string.title
        navigationItem.title = assets.string.navigationTitle
        
        view.backgroundColor = assets.color.view
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.tintColor = assets.color.navigationBarContent
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false

        if let object = textData {
            switch object().type {
            case .text(let text)?:
                textView.text = text
                break
            case .attributed(let attributedtext)?:
                textView.attributedText = attributedtext
                break
            case .plain(let filename, let fileExtension)?:
                if let rtfPath = Bundle.main.url(forResource: filename, withExtension: fileExtension) {
                    do {
                        textView.attributedText =
                            try NSAttributedString(
                                url: rtfPath,
                                options: [.documentType: NSAttributedString.DocumentType.plain],
                                documentAttributes: nil)
                    } catch let error {
                        print(error)
                    }
                }
                break
            case .rtf(let filename, let fileExtension)?:
                if let rtfPath = Bundle.main.url(forResource: filename, withExtension: fileExtension) {
                    do {
                        textView.attributedText =
                            try NSAttributedString(
                                url: rtfPath,
                                options: [.documentType: NSAttributedString.DocumentType.rtf],
                                documentAttributes: nil)
                    } catch let error {
                        print(error)
                    }
                }
                break
            case .html(let filename, let fileExtension)?:
                if let rtfPath = Bundle.main.url(forResource: filename, withExtension: fileExtension) {
                    do {
                        textView.attributedText =
                            try NSAttributedString(
                                url: rtfPath,
                                options: [.documentType: NSAttributedString.DocumentType.html],
                                documentAttributes: nil)
                    } catch let error {
                        print(error)
                    }
                }
                break
            default:
                textView.text = ""
                break
            }
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        textView.setContentOffset(.zero, animated: false)

    }
}

extension MGTextController {
    
    public static var instance: MGTextController {
        let podBundle = Bundle(for: MGTextController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGTextController else {
            return MGTextController()
        }
        return controller
    }
    
}

fileprivate let storyboardName          = "MGText"
fileprivate let controllerIdentifier    = "MGTextController"
fileprivate let resourceName            = "MGTextKit"
fileprivate let resourceExtension       = "bundle"

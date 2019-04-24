//
//  MGMapController.swift
//
//  Copyright © 2019 Dream Building Team All rights reserved.
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
import MapKit


public class MGMapController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    public var delegate:MGMapControllerDelegate?
    public var dataSource:MGMapControllerDataSource?
    public var assets:MGMapAsset!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = assets.string.title
        navigationItem.title = assets.string.title

        view.backgroundColor = assets.color.backgroundView
        navigationController?.navigationBar.tintColor = assets.color.navigationBarTint
        navigationController?.navigationBar.barTintColor = assets.color.navigationBar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false

        if let items = dataSource?.leftBarButtonItems(self) {
            items.forEach({ $0.target = self })
            items.forEach({ $0.action = #selector(navigationItemMenuAction(barButtonItem:)) })
            navigationItem.leftBarButtonItems = items
        }
        
        var pointAnnotations:[MKPointAnnotation] = []
        assets.data.items.forEach { (item) in
            let annotation = MKPointAnnotation()
            annotation.title = item.location
            annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
            mapView.addAnnotation(annotation)
            pointAnnotations.append(annotation)
        }
        mapView.showAnnotations(pointAnnotations, animated: true)
    }
    
    @objc private func navigationItemMenuAction(barButtonItem: UIBarButtonItem) {
        self.delegate?.controller(self, didTapBarButtonItem: barButtonItem)
    }
}

extension MGMapController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
}

extension MGMapController {
    
    public static var instance: MGMapController {
        let podBundle = Bundle(for: MGMapController.self)
        let bundleURL = podBundle.url(forResource: resourceName, withExtension: resourceExtension)
        let bundle = Bundle(url: bundleURL!) ?? Bundle()
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        guard let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier) as? MGMapController else {
            return MGMapController()
        }
        return controller
    }
    
}

fileprivate let storyboardName          = "MGMap"
fileprivate let controllerIdentifier    = "MGMapController"
fileprivate let resourceName            = "MGMapKit"
fileprivate let resourceExtension       = "bundle"

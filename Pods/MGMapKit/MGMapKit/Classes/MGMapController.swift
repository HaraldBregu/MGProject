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
    var mapData:MGMapData!
    var didTapMenu:((MGMapController) -> ()) = { _ in }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
//        title = "mg.mapview.nav.title".localized
//        navigationItem.title = "mg.mapview.nav.title".localized

        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = MGGeneral.NavBar.Theme.dark
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = false

//        let icon: IoniconsType = IoniconsType.naviconRound
//        let image = UIImage(icon: .ionicons(icon), size: CGSize(width: 34, height: 34), textColor: .white)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(revealMenuViewcontroller))

        let london = MKPointAnnotation()
        london.title = "London"
        london.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
        mapView.addAnnotation(london)

        let berlin = MKPointAnnotation()
        berlin.title = "Berlin"
        berlin.coordinate = CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954)
        mapView.addAnnotation(berlin)

        let lyon = MKPointAnnotation()
        lyon.title = "Lyon"
        lyon.coordinate = CLLocationCoordinate2D(latitude: 45.74846, longitude: 4.84671)
        mapView.addAnnotation(lyon)

        let madrid = MKPointAnnotation()
        madrid.title = "Madrid"
        madrid.coordinate = CLLocationCoordinate2D(latitude: 40.416775, longitude: -3.703790)
        mapView.addAnnotation(madrid)

        let milano = MKPointAnnotation()
        milano.title = "Milano"
        milano.coordinate = CLLocationCoordinate2D(latitude: 45.46427, longitude: 9.18951)
        mapView.addAnnotation(milano)

        let durres = MKPointAnnotation()
        durres.title = "Durrës"
        durres.coordinate = CLLocationCoordinate2D(latitude: 41.32306, longitude: 19.44139)
        mapView.addAnnotation(durres)

        mapView.showAnnotations([london, berlin, lyon, madrid, milano, durres], animated: true)
    }
    
    @objc private func revealMenuViewcontroller() {
        didTapMenu(self)
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



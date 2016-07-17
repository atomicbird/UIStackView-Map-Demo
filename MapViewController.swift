//
//  MapViewController.swift
//  MapDemo
//
//  Created by Tom Harrington on 7/16/16.
//  Copyright © 2016 Atomic Bird LLC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.showsUserLocation = true
            mapView.delegate = self
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var altitudeField: UITextField!
    @IBOutlet weak var accuracyField: UITextField!
    
    let locationManager : CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if let location = userLocation.location {
            longitudeField.text = String(format: "%6.4f", location.coordinate.longitude)
            latitudeField.text = String(format: "%6.4f", location.coordinate.latitude)
            altitudeField.text = String(format: "%6.4f", location.altitude)
            accuracyField.text = String(format: "%6.4f", location.horizontalAccuracy)
        }
    }
}

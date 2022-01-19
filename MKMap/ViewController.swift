//
//  ViewController.swift
//  MKMap
//
//  Created by Byot on 29/12/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()//ToFetchCurrentLocation
    
    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationValue = locations.last
      
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationValue?.coordinate.latitude ?? 0.0, longitude: locationValue?.coordinate.longitude ?? 0.0), latitudinalMeters: 0.05, longitudinalMeters: 0.05)
        myMapView.setRegion(region, animated: true)
        
        //Marker
        let myAnnotationMarker = MKPointAnnotation()
        myAnnotationMarker.coordinate = CLLocationCoordinate2D(latitude: locationValue?.coordinate.latitude ?? 0.0, longitude: locationValue?.coordinate.longitude ?? 0.0)
        myAnnotationMarker.title = "Current Location"
        myAnnotationMarker.subtitle = "NSchool"
        myMapView.addAnnotation(myAnnotationMarker)
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}


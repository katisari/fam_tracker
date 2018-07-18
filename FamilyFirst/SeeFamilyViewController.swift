//
//  ViewController.swift
//  FamilyFirst
//
//  Created by Christopher Chung on 7/17/18.
//  Copyright © 2018 Christopher Chung. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class SeeFamilyViewController: UIViewController {
    
    var index = 0
    let people = ["My Son", "My daughter"]
    var allColors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.black]
    
    let coords = [CLLocation(latitude: 37.3688, longitude: -122.0363),
        CLLocation(latitude: 37.248658, longitude: -121.8863)
    ]
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddSegue", sender: self)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
//    let noLocation = CLLocationCoordinate2D()
//    let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 200, 200)
//    mapView.setRegion(viewRegion, animated: false)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        mapView.showsUserLocation = true
        mapView.delegate = self
        addAnnotations(coords: coords)
        enableBasicLocationServices()
        addRadiusCircle(location: CLLocation(latitude: 37.3688, longitude: -122.0363))
        
    }
    func enableBasicLocationServices() {
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            // Request when-in-use authorization initially
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .restricted, .denied:
            // Disable location features
            print("Disable Location Based Features")
            break
            
        case .authorizedWhenInUse, .authorizedAlways:
            // Enable location features
            print("Enable When In Use Features")
            startMonitoringLocation()
            break
        }
    }
    
    func startMonitoringLocation(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1.0  // In meters.
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    func addAnnotations(coords: [CLLocation]){
        for coord in coords{
            let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
                                                      longitude: coord.coordinate.longitude);
            let anno = MKPointAnnotation();
            anno.coordinate = CLLCoordType;
            anno.title = people[index]
            mapView.addAnnotation(anno);
            index += 1
        }
        
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil;
        }else{
            let pinIdent = "Pin";
            var pinView: MKPinAnnotationView;
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation;
                pinView = dequeuedView;
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
                
            }
            return pinView;
        }
    }

}

extension SeeFamilyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! customCell
        cell.nameLabel.text = "My Name"
        cell.uniqueColorLabel.textColor = allColors[indexPath.row]
        return cell
    }
    
}



extension SeeFamilyViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied:
            // Disable location features
            print("Disable Location Based Features")
            break
            
        case .authorizedWhenInUse, .authorizedAlways:
            // Enable location features
            print("Enable When In Use Features")
            startMonitoringLocation()
            break
            
        case .notDetermined:
            print("Location Based Features notDetermined")
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last!
        print(lastLocation.coordinate)
        // Do something with the location.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        UIView.animate(withDuration: 0.5) {
            let angle = newHeading.trueHeading // convert from degrees to radians
            print(angle)
        }
    }
}

extension Double {
    var toRadians: Double { return self * .pi / 180 }
    var toDegrees: Double { return self * 180 / .pi }
}


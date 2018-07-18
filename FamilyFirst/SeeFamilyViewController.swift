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
    
    var people:[String] = []
    var allColors = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.black]
    
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
//        mapView.delegate = self as! MKMapViewDelegate
//        mapView.showsUserLocation = true
        
        
    }
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        let location = locations.last as CLLocation
//
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//
//        self.map.setRegion(region, animated: true)
//    }

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


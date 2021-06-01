//
//  MapViewController.swift
//  BapsTemples
//
//  Created by Shiv Bhagat on 5/27/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    private let address : [Double]
    
    init(address:[Double]){
        self.address = address
        super.init(nibName: nil, bundle: nil)
    }
    
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        //first is latitude and second is longitude
        let annontation = MKPointAnnotation()
        let latitude: Double = address.first!
        let longitude: Double = address.last!
        annontation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        map.addAnnotation(annontation)
        
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        map.setRegion(region, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }


}

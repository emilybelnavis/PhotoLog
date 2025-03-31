//
//  LocationManager.swift
//  PhotoLog
//
//  Created by Emily Belnavis on 2025-03-20.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
}

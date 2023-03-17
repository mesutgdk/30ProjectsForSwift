//
//  ViewController.swift
//  6-FindMyLocation
//
//  Created by Mesut Gedik on 17.03.2023.
//

import UIKit
import CoreLocationUI
import CoreLocation

class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    lazy var geocoder = CLGeocoder()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = "I Guess U re on Earth!"
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        //locationManager.requestLocation()
    }
}

extension LocationViewController: CLLocationManagerDelegate{
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            if let location = locations.last {
               
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                
                geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                    self.processResponce(withPlacemarks: placemarks, error: error)
                }
               
//                findLocation(latitude: lat, longitude: lon)
//                CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
//                    guard error == nil else {
//                        self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
//                        return
//                    }
//                    if placemarks!.count > 0 {
//                        let pm = placemarks!.first
//                        self.displayLocationInfo(pm)
//                    } else {
//                        self.locationLabel.text = "Problem with the data received from geocoder"
//                    }
//                }
//                locationManager.stopUpdatingLocation()
            }
        }
            
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }

    private func findLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "lat=\(latitude)&lon=\(longitude)"
        //performRequest(urlString: urlString)
        print(urlString)
    }
    
    private func processResponce(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        
        if let error = error {
             print("Unable to Reverse Geo Location (\(error))")
             locationLabel.text = "Unable to Find Address for Location"

         } else {
             if let placemarks = placemarks, let placemark = placemarks.first {
                 locationLabel.text = placemark.fullAddress
             } else {
                 locationLabel.text = "No Matching Addresses Found"
             }
         }
    }

}
extension CLPlacemark {
    var fullAddress: String?{
        if let name = name {
            var result = name
            
            if let street = thoroughfare{
                result += ",\(street)"
            }
            if let city = locality {
                result += ",\(city)"
            }
            if let country = country {
                result += ", \(country)"
            }
            return result
        }
        return nil
    }
    
}


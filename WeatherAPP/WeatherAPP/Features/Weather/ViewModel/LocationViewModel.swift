import CoreLocation
import Foundation

class LocationViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()
    
    @Published var cityName: String = ""
    @Published var location: CLLocation?

    var latitude: String {
        guard let location = location else { return "No location" }
        return location.coordinate.latitude.description
    }

    var longitude: String {
        guard let location = location else { return "No location" }
        return location.coordinate.longitude.description
    }

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        location = lastLocation

        getPlace(for: lastLocation) { placemark in
            guard let placemark = placemark,
                  let cityName = placemark.locality else { return }

            self.cityName = cityName
        }
    }

    func getPlace(for location: CLLocation,
                  completion: @escaping (CLPlacemark?) -> Void)
    {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in

            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }

            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }

            completion(placemark)
        }
    }
}

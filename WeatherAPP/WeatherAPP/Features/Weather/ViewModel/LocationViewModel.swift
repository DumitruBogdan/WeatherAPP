import CoreLocation
import Foundation

class LocationViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()

    @Published var cityName: String = ""
    @Published var location: CLLocation?
    @Published var weather: Weather?

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
            ApolloService.shared.getWeatherByCityName(cityName: cityName) { result in
                switch result {
                case let .success(value):
                    self.weather = value
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
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

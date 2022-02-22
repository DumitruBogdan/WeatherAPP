import CoreLocation
import SwiftUI

struct WeatherView: View {
    @StateObject var locationRequest = LocationViewModel()
    var body: some View {
        VStack {
            Text(locationRequest.location?.coordinate.latitude.description ?? "Not a location")
            Text(locationRequest.location?.coordinate.longitude.description ?? "Not a location")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

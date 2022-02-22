import CoreLocation
import SwiftUI

struct WeatherView: View {
    var locationRequest = LocationViewModel()
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

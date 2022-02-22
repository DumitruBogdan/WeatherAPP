import CoreLocation
import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()
            Text(viewModel.latitude)
            Text(viewModel.longitude)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

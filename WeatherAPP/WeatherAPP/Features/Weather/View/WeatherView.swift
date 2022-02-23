import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = LocationViewModel()
    @StateObject var apolloService = ApolloService()

    var body: some View {
        VStack {
            Text("Your city is")
                .font(.largeTitle)
                .padding()
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

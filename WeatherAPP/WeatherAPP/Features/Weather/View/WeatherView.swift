import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = LocationViewModel()
    @StateObject var apolloService = ApolloService()

    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()

            if let weather = viewModel.weather {
                Text(weather.summary.description ?? "")
                    .font(.title)

                Image(systemName: weather.summary.actualIcon)
                    .font(.largeTitle)

                Text("Temperature")
                    .font(.largeTitle)
                    .padding(.top, 30)ß

                HStack(alignment: .center, spacing: 30) {
                    VStack(alignment: .center, spacing: 4) {
                        Text("\(viewModel.weather?.temperature.actualCelsius ?? 0, specifier: "%.0f")°C")
                            .font(.title)
                        Text("Actual")
                            .font(.body)
                    }

                    VStack(alignment: .center, spacing: 4) {
                        Text("\(viewModel.weather?.temperature.feelsLikeCelsius ?? 0, specifier: "%.0f")°C")
                            .font(.title)
                        Text("Feelslike")
                            .font(.body)
                    }
                }

                HStack(alignment: .center, spacing: 50) {
                    VStack(alignment: .center, spacing: 6) {
                        Text("\(viewModel.weather?.temperature.minCelsius ?? 0, specifier: "%.0f")°C")
                            .font(.title)
                        Text("Min")
                            .font(.body)
                    }

                    VStack(alignment: .center, spacing: 6) {
                        Text("\(viewModel.weather?.temperature.maxCelsius ?? 0, specifier: "%.0f")°C")
                            .font(.title)
                        Text("Max")
                            .font(.body)
                    }
                }
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

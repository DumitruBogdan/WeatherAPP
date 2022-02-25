import Apollo
import Foundation
import SwiftUI

class ApolloService: ObservableObject {
    @Published var description = ""
    static let shared = ApolloService()
    lazy var apollo = ApolloClient(url: URL(string: "https://graphql-weather-api.herokuapp.com")!)

    func getWeatherByCityName(cityName: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        ApolloService.shared.apollo.fetch(query: WeatherQuery(name: cityName)) { result in
            switch result {
            case let .success(graphlQLResult):
                guard let result = graphlQLResult.data?.getCityByName?.weather else { return }
                var summaryObject = Summary(title: result.summary?.title, description: result.summary?.description, icon: result.summary?.icon)
                var temperatureObject = Temperature(actual: result.temperature?.actual, feelsLike: result.temperature?.feelsLike, min: result.temperature?.min, max: result.temperature?.max)
                var weatherObject = Weather(summary: summaryObject, temperature: temperatureObject)
                let querryResult = Result<Weather, Error>.success(weatherObject)
                completion(querryResult)
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
}

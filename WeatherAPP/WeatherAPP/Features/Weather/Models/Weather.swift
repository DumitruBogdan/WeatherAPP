import Foundation

struct Weather {
    var summary: Summary
    var temperature: Temperature

    init(summary: Summary, temperature: Temperature) {
        self.summary = summary
        self.temperature = temperature
    }
}

struct Summary {
    let title: String?
    let description: String?
    let icon: String?

    var actualIcon: String {
        if description?.range(of: "cloud") != nil {
            return "cloud"
        }
        if description?.range(of: "sun") != nil || description?.range(of: "clear") != nil {
            return "sun.min"
        }
        if description?.range(of: "rain") != nil {
            return "cloud.rain"
        }
        return "thermometer"
    }
}

struct Temperature {
    var actual: Double?
    var feelsLike: Double?
    var min: Double?
    var max: Double?

    func toCelsius(temp: Double) -> Double {
        return temp - 273.5
    }

    var actualCelsius: Double? {
        return toCelsius(temp: actual ?? 273.5)
    }

    var feelsLikeCelsius: Double? {
        return toCelsius(temp: feelsLike ?? 273.5)
    }

    var minCelsius: Double? {
        return toCelsius(temp: min ?? 273.5)
    }

    var maxCelsius: Double? {
        return toCelsius(temp: max ?? 273.5)
    }
}

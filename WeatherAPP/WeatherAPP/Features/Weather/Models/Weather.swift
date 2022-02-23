import Foundation

struct Weather {
    let summary: Summary?
    let temperature: Temperature?
}

struct Summary {
    let title: String?
    let description: String?
    let icon: String?
}

struct Temperature {
    let actual: Double?
    let feelsLike: Double?
    let min: Double?
    let max: Double?
}

// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class WeatherQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
        """
        query Weather($name: String!) {
          getCityByName(name: $name) {
            __typename
            id
            name
            country
            coord {
              __typename
              lon
              lat
            }
            weather {
              __typename
              summary {
                __typename
                title
                description
                icon
              }
              temperature {
                __typename
                actual
                feelsLike
                min
                max
              }
            }
          }
        }
        """

    public let operationName: String = "Weather"

    public var name: String

    public init(name: String) {
        self.name = name
    }

    public var variables: GraphQLMap? {
        return ["name": name]
    }

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]

        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("getCityByName", arguments: ["name": GraphQLVariable("name")], type: .object(GetCityByName.selections)),
            ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
            resultMap = unsafeResultMap
        }

        public init(getCityByName: GetCityByName? = nil) {
            self.init(unsafeResultMap: ["__typename": "Query", "getCityByName": getCityByName.flatMap { (value: GetCityByName) -> ResultMap in value.resultMap }])
        }

        public var getCityByName: GetCityByName? {
            get {
                return (resultMap["getCityByName"] as? ResultMap).flatMap { GetCityByName(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "getCityByName")
            }
        }

        public struct GetCityByName: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["City"]

            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .scalar(GraphQLID.self)),
                    GraphQLField("name", type: .scalar(String.self)),
                    GraphQLField("country", type: .scalar(String.self)),
                    GraphQLField("coord", type: .object(Coord.selections)),
                    GraphQLField("weather", type: .object(Weather.selections)),
                ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
                resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, name: String? = nil, country: String? = nil, coord: Coord? = nil, weather: Weather? = nil) {
                self.init(unsafeResultMap: ["__typename": "City", "id": id, "name": name, "country": country, "coord": coord.flatMap { (value: Coord) -> ResultMap in value.resultMap }, "weather": weather.flatMap { (value: Weather) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
                get {
                    return resultMap["__typename"]! as! String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                }
            }

            public var id: GraphQLID? {
                get {
                    return resultMap["id"] as? GraphQLID
                }
                set {
                    resultMap.updateValue(newValue, forKey: "id")
                }
            }

            public var name: String? {
                get {
                    return resultMap["name"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "name")
                }
            }

            public var country: String? {
                get {
                    return resultMap["country"] as? String
                }
                set {
                    resultMap.updateValue(newValue, forKey: "country")
                }
            }

            public var coord: Coord? {
                get {
                    return (resultMap["coord"] as? ResultMap).flatMap { Coord(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "coord")
                }
            }

            public var weather: Weather? {
                get {
                    return (resultMap["weather"] as? ResultMap).flatMap { Weather(unsafeResultMap: $0) }
                }
                set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "weather")
                }
            }

            public struct Coord: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Coordinates"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("lon", type: .scalar(Double.self)),
                        GraphQLField("lat", type: .scalar(Double.self)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(lon: Double? = nil, lat: Double? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Coordinates", "lon": lon, "lat": lat])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var lon: Double? {
                    get {
                        return resultMap["lon"] as? Double
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "lon")
                    }
                }

                public var lat: Double? {
                    get {
                        return resultMap["lat"] as? Double
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "lat")
                    }
                }
            }

            public struct Weather: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Weather"]

                public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("summary", type: .object(Summary.selections)),
                        GraphQLField("temperature", type: .object(Temperature.selections)),
                    ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                    resultMap = unsafeResultMap
                }

                public init(summary: Summary? = nil, temperature: Temperature? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Weather", "summary": summary.flatMap { (value: Summary) -> ResultMap in value.resultMap }, "temperature": temperature.flatMap { (value: Temperature) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                    get {
                        return resultMap["__typename"]! as! String
                    }
                    set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                    }
                }

                public var summary: Summary? {
                    get {
                        return (resultMap["summary"] as? ResultMap).flatMap { Summary(unsafeResultMap: $0) }
                    }
                    set {
                        resultMap.updateValue(newValue?.resultMap, forKey: "summary")
                    }
                }

                public var temperature: Temperature? {
                    get {
                        return (resultMap["temperature"] as? ResultMap).flatMap { Temperature(unsafeResultMap: $0) }
                    }
                    set {
                        resultMap.updateValue(newValue?.resultMap, forKey: "temperature")
                    }
                }

                public struct Summary: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Summary"]

                    public static var selections: [GraphQLSelection] {
                        return [
                            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                            GraphQLField("title", type: .scalar(String.self)),
                            GraphQLField("description", type: .scalar(String.self)),
                            GraphQLField("icon", type: .scalar(String.self)),
                        ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public init(title: String? = nil, description: String? = nil, icon: String? = nil) {
                        self.init(unsafeResultMap: ["__typename": "Summary", "title": title, "description": description, "icon": icon])
                    }

                    public var __typename: String {
                        get {
                            return resultMap["__typename"]! as! String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "__typename")
                        }
                    }

                    public var title: String? {
                        get {
                            return resultMap["title"] as? String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "title")
                        }
                    }

                    public var description: String? {
                        get {
                            return resultMap["description"] as? String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "description")
                        }
                    }

                    public var icon: String? {
                        get {
                            return resultMap["icon"] as? String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "icon")
                        }
                    }
                }

                public struct Temperature: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["Temperature"]

                    public static var selections: [GraphQLSelection] {
                        return [
                            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                            GraphQLField("actual", type: .scalar(Double.self)),
                            GraphQLField("feelsLike", type: .scalar(Double.self)),
                            GraphQLField("min", type: .scalar(Double.self)),
                            GraphQLField("max", type: .scalar(Double.self)),
                        ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                        resultMap = unsafeResultMap
                    }

                    public init(actual: Double? = nil, feelsLike: Double? = nil, min: Double? = nil, max: Double? = nil) {
                        self.init(unsafeResultMap: ["__typename": "Temperature", "actual": actual, "feelsLike": feelsLike, "min": min, "max": max])
                    }

                    public var __typename: String {
                        get {
                            return resultMap["__typename"]! as! String
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "__typename")
                        }
                    }

                    public var actual: Double? {
                        get {
                            return resultMap["actual"] as? Double
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "actual")
                        }
                    }

                    public var feelsLike: Double? {
                        get {
                            return resultMap["feelsLike"] as? Double
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "feelsLike")
                        }
                    }

                    public var min: Double? {
                        get {
                            return resultMap["min"] as? Double
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "min")
                        }
                    }

                    public var max: Double? {
                        get {
                            return resultMap["max"] as? Double
                        }
                        set {
                            resultMap.updateValue(newValue, forKey: "max")
                        }
                    }
                }
            }
        }
    }
}

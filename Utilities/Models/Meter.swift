import Foundation

struct Meter: Equatable, Identifiable {
    struct MeterEntity: Equatable, Identifiable {
        let id = UUID()
        var type: String? = nil
        var values: [Meter.Value]
    }
    struct Value: Equatable, Identifiable {
        let id = UUID()
        var created: Date
        var value: Int
        var difference: Int

        init(created: Date, value: Int, previous: Int? = nil) {
            self.created = created
            self.value = value
            let previous = previous ?? value
            self.difference = value - previous
        }
    }

    enum MeterType {
        case water
        case gas
        case electricity

        var title: String {
            switch self {
            case .water:
                return "Water"
            case .gas:
                return "Gas"
            case .electricity:
                return "Electricity"
            }
        }
    }

    let id = UUID()
    var type: MeterType
    var values: [MeterEntity]

    var generalValues: (value: Int, difference: Int) {
        values.reduce((0, 0)) { partialResult, meter in
            let firstMeter = meter.values.first?.value ?? 0
            let firstDifference = meter.values.first?.difference ?? 0
            return (partialResult.0 + firstMeter, partialResult.1 + firstDifference)
        }
    }

    init(type: MeterType, values: [MeterEntity]) {
        self.values = values
        self.type = type
    }
}

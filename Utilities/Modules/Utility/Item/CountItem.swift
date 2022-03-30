import Foundation

enum CountItem: ItemTypeProtocol {
    case waterKitchen
    case waterBathroom
    case gas
    case electricity

    var title: String {
        switch self {
        case .waterKitchen:
            return "counter_item_water_1_title".localized
        case .waterBathroom:
            return "counter_item_water_2_title".localized
        case .gas, .electricity:
            return "counter_general_title".localized
        }
    }

    var format: (NSNumber) -> String? {
        formatAsCubicMetersValue
    }

    private func formatAsCubicMetersValue(_ value: NSNumber) -> String? {
        Formatter.measurementFormatter.string(
            from: Measurement(value: Double(truncating: value),
                              unit: UnitVolume.cubicMeters)
        )
    }
}

extension Utility {
    static let mock: Self = {
        .init(
            type: .waterSupply,
            mainPart: .init(
                type: .consumption,
                counters: [
                    .init(
                        item: .waterKitchen,
                        value: 44 - 39
                    ),
                    .init(
                        item: .waterBathroom,
                        value: 519 - 515
                    )
                ],
                tariff: 15.744,
                fee: 3
            ),
            parts: [
                .init(
                    type: .delivery,
                    tariff: 13.068,
                    fee: 3
                )
            ]
        )
    }()
}

struct Utility: Equatable, Identifiable {
    let id = UUID()
    let type: UtilitySectionType
    let mainPart: UtilityPricePart
    let parts: [UtilityPricePart]

    var sum: String {
        let sum = mainPart.sum + parts.reduce(0) { $0 + $1.sum }
        return Formatter.currencyFormatter.string(from: sum as NSNumber) ?? "-"
    }
}

struct UtilityPricePart: Equatable {
    enum PartType {
        case consumption
        case delivery
    }

    var sum: Double {
        let countersSum = counters.isEmpty ? tariff : counters.reduce(0) { $0 + $1.value * tariff }
        return fee + countersSum
    }
    let type: PartType

    let counters: [Counter]
    let tariff: Double

    let fee: Double

    init(type: PartType, counters: [Counter] = [], tariff: Double, fee: Double) {
        self.counters = counters
        self.type = type
        self.tariff = tariff
        self.fee = fee
    }
}

struct Counter: Equatable {
    var item: CountItem
    let value: Double

    var toItem: Item {
        Item(type: item, value: value as NSNumber)
    }
}

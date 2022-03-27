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

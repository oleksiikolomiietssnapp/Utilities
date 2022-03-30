import Foundation

enum PriceItem: ItemTypeProtocol {
    case tariff
    case delivery
    case fee
    case expenses

    var title: String {
        switch self {
        case .tariff:
            return "item_tariff_title".localized
        case .delivery:
            return "item_delivery_title".localized
        case .fee:
            return "item_fee_title".localized
        case .expenses:
            return "item_expenses_title".localized
        }
    }

    var format: (NSNumber) -> String? {
        switch self {
        case .tariff:
            return { number in
                let tariffPrice = Formatter.currencyFormatter.string(from: number) ?? "-"
                let measurement = Formatter.measurementFormatter.string(
                    from: Measurement(
                        value: Double(truncating: 0),
                        unit: UnitVolume.cubicMeters
                    )
                ).replacingOccurrences(of: "0", with: "")
                return tariffPrice + "/" + measurement
            }
        case .fee, .delivery, .expenses:
            return Formatter.currencyFormatter.string
        }
    }
}

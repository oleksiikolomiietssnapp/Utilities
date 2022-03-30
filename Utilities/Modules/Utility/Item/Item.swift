import Foundation

protocol ItemProtocol: Equatable, Identifiable {
    var type: ItemTypeProtocol { get set }
    var value: String { get set }
}

protocol ItemTypeProtocol {
    var title: String { get }
    var format: (NSNumber) -> String? { get }
}

struct Item: ItemProtocol {
    let id = UUID()
    var type: ItemTypeProtocol
    var value: String

    init(type: ItemTypeProtocol, value: NSNumber) {
        self.value = type.format(value) ?? "-"
        self.type = type
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id && lhs.type.title == rhs.type.title && lhs.value == rhs.value
    }
}

extension Item {
    static func fee(value: NSNumber) -> Self {
        Item(type: PriceItem.fee, value: value)
    }

    static func tariff(value: NSNumber) -> Self {
        Item(type: PriceItem.tariff, value: value)
    }

    static func delivery(value: NSNumber) -> Self {
        Item(type: PriceItem.delivery, value: value)
    }

    static func waterKitchen(value: NSNumber) -> Self {
        Item(type: CountItem.waterKitchen, value: value)
    }

    static func waterBathroom(value: NSNumber) -> Self {
        Item(type: CountItem.waterBathroom, value: value)
    }

    static func expenses(value: NSNumber) -> Self {
        Item(type: PriceItem.expenses, value: value)
    }
}

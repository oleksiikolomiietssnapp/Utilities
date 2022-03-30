import Foundation

final class Cache<Value: Codable & Equatable>: Codable {
    var values: [Value]
    init(values: [Value]) {
        self.values = values
    }

//    @discardableResult
//    func addValue(_ value: Value, forKey key: Key) -> Bool {
//        if !items.contains(where: { $0.key == key }) {
//            items.insert(Item(key: key, value: value))
//            return true
//        }
//        return false
//    }
//
//    @discardableResult
//    func removeValue(forKey key: Key) -> Bool {
//        if let item = items.first(where: { $0.key == key }) {
//            items.remove(item)
//            return true
//        }
//        return false
//    }
//
//    @discardableResult
//    func updateValue(_ value: Value, forKey key: Key) -> Bool {
//        if let item = items.first(where: { $0.key == key }) {
//            items.remove(item)
//            return true
//        }
//        return false
//    }
//
//    func value(key: Key) -> Value? {
//        items.first(where: { $0.key == key })?.value
//    }
//
//    func contains(value: Value, key: Key) -> Bool {
//        items.contains { $0.key == key && $0.value == value }
//    }
}

//extension Cache.Item: Codable & Hashable {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.key == rhs.key
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(key)
//    }
//}

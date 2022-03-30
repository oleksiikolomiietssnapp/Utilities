import Foundation

enum Tab: Int {
    case home = 1, meters

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .meters:
            return "Meters"
        }
    }
}

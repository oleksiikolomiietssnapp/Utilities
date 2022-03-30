import Foundation

extension Date {

    private static var currentDateComponents: DateComponents {
        Calendar.current.dateComponents(in: .current, from: .now)
    }

    static var year: Int {
        guard let year = currentDateComponents.year else {
            fatalError("Can't get the year.")
        }
        return year
    }

    static var month: Int {
        guard let month = currentDateComponents.month else {
            fatalError("Can't get the month.")
        }
        return month
    }

}

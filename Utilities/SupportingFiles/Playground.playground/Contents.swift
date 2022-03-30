import UIKit

extension Date {

    private static func dateComponents(of date: Date = .now) -> DateComponents {
        Calendar.current.dateComponents(in: .current, from: date)
    }

    static var year: Int {
        guard let year = dateComponents().year else {
            fatalError("Can't get the year.")
        }
        return year
    }

    static var month: Int {
        guard let month = dateComponents().month else {
            fatalError("Can't get the month.")
        }
        return month
    }

    static var previousMonth: Int {
        guard let previousMonthDate = Calendar.current.date(byAdding: .month, value: -1, to: .now) else {
            fatalError("Can't get the previous month date.")
        }
        guard let previousMonth = dateComponents(of: previousMonthDate).month else {
            fatalError("Can't get the previous month.")
        }
        return previousMonth
    }


}

Date.previousMonth
Date.month

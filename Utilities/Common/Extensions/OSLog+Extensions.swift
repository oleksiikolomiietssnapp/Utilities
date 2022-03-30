import Foundation
import os.log

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier ?? "Utilities"

    /// Logs the view cycles like viewDidLoad.
    static let viewCycle = OSLog(subsystem: subsystem, category: "ViewCycle")
    static let apiData = OSLog(subsystem: subsystem, category: "APIData")
    static let app = OSLog(subsystem: subsystem, category: "Application")
}

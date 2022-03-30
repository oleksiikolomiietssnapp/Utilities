import SwiftUI

@main
struct UtilitiesApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(selection: .meters))
        }
    }
}

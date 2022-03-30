import IdentifiedCollections
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: AppViewModel

    var body: some View {
        TabView(selection: $viewModel.selection) {
            Text("Home")
                .tabItem { Label(Tab.home.title, systemImage: "house") }
                .tag(Tab.home)
            MetersView(viewModel: .mock)
                .tabItem { Label(Tab.meters.title, systemImage: "wallet.pass")}
                .tag(Tab.meters)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(selection: .meters))
    }
}

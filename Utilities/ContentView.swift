import SwiftUI

struct ContentView: View {
    var body: some View {
        UtilitySection(viewModel: .init(section: .init(type: .waterSupply, value: 2223.23)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

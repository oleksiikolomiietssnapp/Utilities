import SwiftUI

struct UtilityHItem: View {
    @State var item: Item

    var body: some View {

        HStack {
            Text(item.type.title)
            Spacer()
            Text(item.value)
        }
    }
}

struct UtilityVItem: View {
    @State var item: Item

    var body: some View {

        VStack(alignment: .leading) {
            Text(item.type.title)
            Text(item.value)
        }
    }
}

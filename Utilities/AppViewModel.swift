import Foundation

class AppViewModel: ObservableObject {
//    @Published var inventoryViewModel: InventoryViewModel
    @Published var selection: Tab

    init(
//        inventoryViewModel: InventoryViewModel = .init(),
        selection: Tab = .home
    ) {
//        self.inventoryViewModel = inventoryViewModel
        self.selection = selection
    }
}

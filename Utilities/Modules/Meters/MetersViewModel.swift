import IdentifiedCollections
import Foundation

class MetersViewModel: ObservableObject {
    @Published var meters: IdentifiedArrayOf<MeterSectionViewModel>

    init(
        meters: IdentifiedArrayOf<MeterSectionViewModel> = []
    ) {
        self.meters = meters

        for meterRowViewModel in meters {
            bind(meterRowViewModel: meterRowViewModel)
        }
    }

    private func bind(meterRowViewModel: MeterSectionViewModel) {
//        itemRowViewModel.onDelete = { [weak self, item = itemRowViewModel.item] in
//            withAnimation {
//                self?.delete(item: item)
//            }
//        }
//        itemRowViewModel.onDuplicate = { [weak self] item in
//            withAnimation {
//                self?.add(item: item)
//            }
//        }
//        itemRowViewModel.$route
//            .map { [id = itemRowViewModel.id] route in
//                route.map { Route.row(id: id, route: $0)}
//            }
//            .removeDuplicates()
//            .dropFirst()
//            .assign(to: &self.$route)
//        $route
//            .map { [id = itemRowViewModel.id] route in
//                guard case let .row(id: routeRowId, route: route) = route,
//                      routeRowId == id
//                else { return nil }
//                return route
//            }
//            .removeDuplicates()
//            .assign(to: &itemRowViewModel.$route)
//        inventory.append(itemRowViewModel)
    }
}

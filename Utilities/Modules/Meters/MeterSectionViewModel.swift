import Foundation

class MeterSectionViewModel: Identifiable, ObservableObject {
    @Published var meter: Meter

    init(
        meter: Meter
    ) {
        self.meter = meter
    }
}

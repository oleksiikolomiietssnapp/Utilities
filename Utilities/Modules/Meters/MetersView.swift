import SwiftUI

struct MetersView: View {
    @ObservedObject var viewModel: MetersViewModel

    var body: some View {

        Form {
            ForEach(self.viewModel.meters, content: MeterSectionView.init(viewModel:))
        }
        
    }
}

struct MetersView_Previews: PreviewProvider {
    static var previews: some View {
        MetersView(viewModel: .mock)
    }
}

extension MetersViewModel {
    static let mock: MetersViewModel = {
        .init(meters: [
            .init(meter: .init(type: .electricity, values: [
                .init(values: [
                    .init(created: .now, value: 29509, previous: 29301),
                    .init(created: Date(timeInterval: -31*24*60*60, since: .now), value: 29301, previous: 29043),
                    .init(created: Date(timeInterval: -31*24*60*60*2, since: .now), value: 29043, previous: 28754),
                    .init(created: Date(timeInterval: -31*24*60*60*3, since: .now), value: 28754)
                ])
            ])),
            .init(meter: .init(type: .gas, values: [
                .init(values: [
                    .init(created: .now, value: 17247, previous: 17120),
                    .init(created: Date(timeInterval: -31*24*60*60, since: .now), value: 17120, previous: 16912),
                    .init(created: Date(timeInterval: -31*24*60*60*2, since: .now), value: 16912, previous: 16700),
                    .init(created: Date(timeInterval: -31*24*60*60*3, since: .now), value: 16700)
                ])
            ])),
            .init(meter: .init(type: .water, values: [
                .init(type: "Kitchen", values: [
                    .init(created: .now, value: 44, previous: 39),
                    .init(created: Date(timeInterval: -31*24*60*60, since: .now), value: 39, previous: 32),
                    .init(created: Date(timeInterval: -31*24*60*60*2, since: .now), value: 32, previous: 24),
                    .init(created: Date(timeInterval: -31*24*60*60*2, since: .now), value: 24)
                ]),
                .init(type: "Bathroom", values: [
                    .init(created: .now, value: 519, previous: 515),
                    .init(created: Date(timeInterval: -31*24*60*60, since: .now), value: 515, previous: 509),
                    .init(created: Date(timeInterval: -31*24*60*60*2, since: .now), value: 509, previous: 503),
                    .init(created: Date(timeInterval: -31*24*60*60*2, since: .now), value: 503)
                ])

            ]))
        ])
    }()
}

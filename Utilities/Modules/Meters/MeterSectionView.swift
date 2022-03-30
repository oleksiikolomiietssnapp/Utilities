import SwiftUI

struct MeterSectionView: View {

    @ObservedObject var viewModel: MeterSectionViewModel

    var body: some View {

        Section {
            ForEach(viewModel.meter.values) { value in

                HStack {
                    if let name = value.type {
                        Text(name)
                    }
                    Spacer()
                    Text("*ADD METER*")
                }

                ForEach(value.values.prefix(3)) { meterValue in
                    HStack {
                        Text(meterValue.created.description.prefix(7))
                        Spacer()
                        Text("**\(meterValue.difference)**")
                        Text("\(Int(meterValue.value))")
                    }
                    .font(.callout)
                }
                .padding(.leading, 16)

                HStack {
                    Text("History")
                    Spacer()
                    Text("*NAVIGATION LINK*")
                }
            }


        } header: {
            HStack {
                Text("**\(viewModel.meter.type.title)**")
                Spacer()
                Text("\(viewModel.meter.generalValues.value)")
            }
        }
    }
}

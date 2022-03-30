import SwiftUI

enum UtilitySectionType {
    case waterSupply

    var title: String {
        switch self {
        case .waterSupply:
            return "section_water_supply_title".localized
        }
    }

    var tariffValue: Double {
        switch self {
        case .waterSupply:
            return 15.744
        }
    }
}

class SectionViewModel: Identifiable, ObservableObject {
    @Published var utility: Utility
    @Published var isExpanded: Bool = false

    init(utility: Utility) {
        self.utility = utility
    }
}

struct UtilitySection: View {
    @ObservedObject var viewModel: SectionViewModel

    var body: some View {

        Form {
            DisclosureGroup(isExpanded: $viewModel.isExpanded.animation(), content: {

                VStack(alignment: .leading) {
                    UtilityHItem(item: .delivery(value: 13.068))
                    UtilityHItem(item: .fee(value: 1))
                    Divider()

                    HStack {
                        UtilityVItem(item: .tariff(value: viewModel.utility.mainPart.tariff as NSNumber))
                        VStack {
                            ForEach(viewModel.utility.mainPart.counters.map(\.toItem)) { item in
                                UtilityHItem(item: item)
                            }
                        }
                    }
                    UtilityHItem(item: .expenses(value: viewModel.utility.mainPart.sum as NSNumber))
                    UtilityHItem(item: .fee(value: viewModel.utility.mainPart.fee as NSNumber))

                }.padding(.vertical, 8)

            }, label: {
                HStack {
                    Text(viewModel.utility.type.title)
                    Spacer()
                    Text(viewModel.utility.sum)
                }
            })
        }
    }
}

struct UtilitySection_Previews: PreviewProvider {
    static var previews: some View {
        UtilitySection(
            viewModel: .init(
                utility: Utility.mock
            )
        )
    }
}

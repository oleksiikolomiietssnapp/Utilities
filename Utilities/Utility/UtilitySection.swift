import SwiftUI

enum UtilitySectionType {
    case waterSupply

    var title: String {
        switch self {
        case .waterSupply:
            return "section_water_supply_title".localized
        }
    }
}

struct Section: Equatable, Identifiable {
    let id = UUID()
    var type: UtilitySectionType
    var value: String
    var isExpanded: Bool = false

    init(type: UtilitySectionType, value: NSNumber) {
        self.value = Formatter.currencyFormatter.string(from: value) ?? "-"
        self.type = type
    }
}

class SectionViewModel: Identifiable, ObservableObject {
    @Published var section: Section
    @Published var items: [Item]

    init(section: Section, items: [Item] = []) {
        self.section = section
        self.items = items
    }
}

struct UtilitySection: View {
    @ObservedObject var viewModel: SectionViewModel

    var body: some View {

        Form {
            DisclosureGroup(isExpanded: $viewModel.section.isExpanded.animation(), content: {

                VStack(alignment: .leading) {
                    UtilityHItem(item: .delivery(value: 13.068))
                    UtilityHItem(item: .fee(value: 1))
                    Divider()

                    HStack {
                        UtilityVItem(item: .tariff(value: 15.744))
                        VStack {
                            UtilityHItem(item: .waterKitchen(value: 44))
                            UtilityHItem(item: .waterBathroom(value: 519))
                        }
                    }
                    UtilityHItem(item: .expenses(value: (44+519)*15.744 as NSNumber))
                    UtilityHItem(item: .fee(value: 3))

                }.padding(.vertical, 8)

            }, label: {
                HStack {
                    Text(viewModel.section.type.title)
                    Spacer()
                    Text(viewModel.section.value)
                }
            })
        }
    }
}

struct UtilitySection_Previews: PreviewProvider {
    static var previews: some View {
        UtilitySection(
            viewModel: .init(
                section: .init(
                    type: .waterSupply, value: 2.2
                )
            )
        )
    }
}

import SwiftUI

struct OptionSection: View {
    @State private var voucherList: [Voucher] = Voucher.dummyVouchers
    @State private var selectedClassification: String? = "Personal Voucher"
    
    var classification: [String] {
        let allClassification = voucherList.map {$0.classification}
        return Array(Set(allClassification)).sorted()
    }
    
    var body: some View {
        HStack{
            ForEach(classification, id: \.self) { list in
                OptionPicker(
                    classificationName: list,
                    isSelected: selectedClassification == list
                ) {
                    selectedClassification = list
                }
            }
        }
    }
}

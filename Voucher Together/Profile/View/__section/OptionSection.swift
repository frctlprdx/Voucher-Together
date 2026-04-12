import SwiftUI

struct OptionSection: View {
    @Binding var selectedClassification: String
    
    // Gunakan pilihan tetap agar tombol tidak hilang saat data kosong
    let classifications = ["Personal Voucher", "Sharing Voucher"]
    
    var body: some View {
        HStack(spacing: 15) {
            ForEach(classifications, id: \.self) { list in
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

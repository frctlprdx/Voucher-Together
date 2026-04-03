import SwiftUI

struct OptionPicker: View {
    let classificationName: String
    let isSelected: Bool
    let action: () -> Void // Memberitahu parent jika diklik
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(classificationName)
                .font(.footnote)
                .fontWeight(isSelected ? .bold : .regular)
                .padding(.horizontal, 24) // Padding disesuaikan agar proporsional
                .padding(.vertical, 10)
                .foregroundColor(isSelected ? .blue : .primary)
                .background(
                    Capsule() // Lebih aman daripada RoundedRectangle(100)
                        .fill(isSelected ? Color.blue.opacity(0.15) : Color.gray.opacity(0.1))
                )
        }

    }
}

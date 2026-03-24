import SwiftUI

struct MenuPicker: View {
    let categoryName: String
    
    var body: some View {
        Button {
            //action
        } label: {
            Text(categoryName).padding(.horizontal, 8)
        }.buttonStyle(.borderedProminent).controlSize(.small).buttonBorderShape(.capsule)

    }
}


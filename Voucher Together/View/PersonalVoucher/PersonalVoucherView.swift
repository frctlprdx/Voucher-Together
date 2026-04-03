import SwiftUI

struct PersonalVoucherView: View {
    var body: some View {
        NavigationStack{
                VStack{
                    ProfileSection()
                    OptionSection()
                    PersonalVoucher()
                }.navigationTitle("Personal")
        }
    }
}

#Preview {
    PersonalVoucherView()
}


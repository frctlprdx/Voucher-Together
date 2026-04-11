import SwiftUI

struct PersonalVoucherView: View {
    @State private var selectedClassification: String = "Personal Voucher"
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(spacing: 20) {
                        ProfileSection().environmentObject(authViewModel)
                        OptionSection(selectedClassification: $selectedClassification)
                        PersonalVoucher(selectedClassification: selectedClassification)
                    }
                    .padding(.top)
                }
                .navigationTitle("Personal Profile")
                
                NavigationLink(destination: AddVoucherView()) {
                    Image(systemName: "plus")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding(25)
            }
        }
    }
}

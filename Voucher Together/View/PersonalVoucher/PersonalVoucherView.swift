import SwiftUI

struct PersonalVoucherView: View {
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottomTrailing){
                VStack{
                    ProfileSection()
                    OptionSection()
                    PersonalVoucher()
                }.navigationTitle("Personal Profile")
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

#Preview {
    PersonalVoucherView()
}


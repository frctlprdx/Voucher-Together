import SwiftUI

struct VoucherCard: View {
    let vouchers: Voucher

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack (alignment: .topTrailing){
                AsyncImage(url: URL(string: vouchers.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .clipped()
                .cornerRadius(15)
                Button {
                    //action
                } label: {
                    Image(systemName: "heart").foregroundStyle(Color.white).font(Font.system(size: 20))
                }
                .padding()
                .background(Circle().foregroundStyle(Color.gray).opacity(0.5))
                .padding(5)
            }
            
            HStack {
                Text(vouchers.title)
                    .font(.headline)
                    .foregroundStyle(.black)
                Spacer()
                AsyncImage(url: URL(string: vouchers.hostImageURL ?? "")) { image in
                    image.resizable().frame(width: 20, height: 20)
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                Text(vouchers.host)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            HStack {
                Text(vouchers.minimumPurchase)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
                CountdownTimerView(endDate: vouchers.countdown)
            }
            
            
            VStack(alignment: .trailing, spacing: 5) {
                ProgressView(value: Double(vouchers.currentPeople), total: Double(vouchers.maxPeople))
                    .tint(.blue)
                
                Text("\(vouchers.currentPeople)/\(vouchers.maxPeople) People")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}
//#Preview {
//    VoucherCard(vouchers: Voucher.dummyVouchers[0])
//}

import SwiftUI

struct VoucherDetail: View {
    let voucherDetail: Voucher
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }.buttonStyle(.bordered).controlSize(.extraLarge).buttonBorderShape(.circle)
                Spacer()
                Text("Voucher Detail").font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }.buttonStyle(.bordered).controlSize(.extraLarge).buttonBorderShape(.circle)
                
            }.padding()
            VStack (alignment: .leading, spacing: 10){
                AsyncImage(url: URL(string: voucherDetail.imageURL ?? "")) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .clipped()
                .cornerRadius(15)
                
                HStack (alignment: .bottom) {
                    Text(voucherDetail.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Text(voucherDetail.category)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Spacer()
                    AsyncImage(url: URL(string: voucherDetail.hostImageURL ?? "")) { image in
                        image.resizable().frame(width: 20, height: 20)
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    Text(voucherDetail.host)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                VStack(alignment: .leading) {
                    ProgressView(value: Double(voucherDetail.currentPeople), total: Double(voucherDetail.maxPeople))
                        .tint(.blue)
                    
                    Text("\(voucherDetail.currentPeople)/\(voucherDetail.maxPeople) People")
                        .font(.caption2)
                        .foregroundStyle(.blue)
                }
                
                Text(voucherDetail.discount)
                    .font(.body)
                    .foregroundStyle(.black)
                
                HStack {
                    Text(voucherDetail.minimumPurchase)
                        .font(.body)
                        .foregroundStyle(.black)
                    Spacer()
                    CountdownTimerView(endDate: voucherDetail.countdown)
                    
                }
            }
            List {
                DisclosureGroup {
                    Text(voucherDetail.description) // Deskripsi muncul di sini
                        .font(.footnote)
                        .foregroundColor(.black)
                } label: {
                    HStack{
                        Text("Description")
                    }
                }
                DisclosureGroup {
                    //action
                } label: {
                    HStack{
                        Text("People")
                    }
                }

           }.listStyle(PlainListStyle())
            Spacer()
            Button {
                
            } label: {
                Text("Join This Group")
            }.buttonStyle(.bordered).controlSize(.extraLarge).buttonBorderShape(.capsule)
        }.padding()
    }
}

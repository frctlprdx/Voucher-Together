import SwiftUI

struct AddVoucherView: View {
    @State private var imageURL: String? = ""
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var classification: String = ""
    @State private var discount: String = ""
    @State private var minimumPurchase: String = ""
    @State private var maxPeople: Int = 0
    @State private var description: String = ""
    @State private var countdown: Date = Date()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Voucher Title")) {
                    TextField("Title", text: $title)
                }
                Section(header: Text("Voucher Details")) {
                    TextField("Food Category", text: $category)
                    TextField("Discount Description", text: $discount)
                    TextField("Minimum Purchase", text: $minimumPurchase)
                    Stepper("Max Members: \(maxPeople)", value: $maxPeople, in: 0...100)
                    TextEditor(text: $description)
                        .frame(height: 100)
                        .overlay(
                            Group {
                                if description.isEmpty {
                                    Text("Voucher Description")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 4)
                                        .padding(.vertical, 8)
                                }
                            }, alignment: .topLeading
                        )
                }
                Section(header: Text("Date")) {
                    DatePicker(
                        "Start Date",
                        selection: $countdown,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }
                Button {
                    //action
                } label: {
                    Text ("Save Voucher")
                        .frame(maxWidth: .infinity)
                }.tint(Color.blue)
            }
        }.navigationTitle("Add New Voucher")
    }
}

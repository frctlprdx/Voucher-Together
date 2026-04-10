import SwiftUI

struct UpdateList: View {
    @State private var updateList: [Update] = Update.dummyUpdate

    var body: some View {
        List {
            ForEach(updateList) { item in
                Section(header: Text(item.time, format: .dateTime.day().month().year())) {
                    
                    // Tambahkan NavigationLink di sini
                    NavigationLink(destination: UpdateDetailView(update: item)) {
                        HStack(alignment: .top, spacing: 12) {
                            if !item.opened {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 8, height: 8)
                                    .padding(.top, 6)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.notifications)
                                    .font(.system(size: 15))
                                    .fontWeight(item.opened ? .regular : .semibold)
                                    .foregroundColor(.primary)
                                
                                Text(item.time, style: .relative)
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}

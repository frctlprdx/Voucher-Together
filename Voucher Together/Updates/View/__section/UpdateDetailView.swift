import SwiftUI

struct UpdateDetailView: View {
    let update: Update

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(update.time, format: .dateTime.day().month().year().hour().minute())
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(update.notifications)
                .font(.title3)
                .fontWeight(.medium)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detail Notifikasi")
        .navigationBarTitleDisplayMode(.inline)
    }
}

import SwiftUI

struct UpdateList: View {
    @StateObject var viewModel = UpdateViewModel()

    var body: some View {
        Group {
            if viewModel.isLoading && viewModel.updates.isEmpty {
                // Loading state saat pertama kali ambil data
                ProgressView("Fetching updates...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.updates.isEmpty {
                // Tampilan saat benar-benar tidak ada data di Firebase
                VStack {
                    Spacer()
                    EmptyStateView(
                        imageName: "bell.slash.fill",
                        title: "No Updates Yet",
                        subtitle: "You're all caught up! Check back later for new notifications."
                    )
                    Spacer()
                }
            } else {
                List {
                    ForEach(viewModel.updates) { item in
                        // Section berdasarkan tanggal agar lebih rapi
                        Section(header: Text(item.time, format: .dateTime.day().month().year())) {
                            NavigationLink(destination: UpdateDetailView(update: item)) {
                                HStack(alignment: .top, spacing: 12) {
                                    // Indikator titik biru untuk notifikasi yang belum dibuka
                                    if !item.opened {
                                        Circle()
                                            .fill(Color.blue)
                                            .frame(width: 8, height: 8)
                                            .padding(.top, 6)
                                    } else {
                                        // Spacer agar teks tetap sejajar meski tidak ada titik biru
                                        Color.clear.frame(width: 8, height: 8)
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
        .onAppear {
            viewModel.fetchUpdates()
        }
    }
}

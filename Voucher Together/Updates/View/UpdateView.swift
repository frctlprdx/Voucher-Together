import SwiftUI

struct UpdateView: View {
    var body: some View {
        NavigationStack {
            VStack {
                UpdateList()
            }
            .navigationTitle("Updates") // Title ada di sini
        }
    }
}

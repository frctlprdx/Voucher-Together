import SwiftUI
internal import Combine

struct CountdownTimerView: View {
    let endDate: Date
    @State private var timeLeft = ""
    
    // Timer yang mengupdate setiap detik
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "clock")
                .font(.caption2)
            Text(timeLeft)
                .font(.caption2.monospacedDigit()) // Monospaced agar angka tidak goyang
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(.red.opacity(0.1))
        .foregroundStyle(.red)
        .cornerRadius(8)
        .onReceive(timer) { _ in
            updateTime()
        }
        .onAppear {
            updateTime()
        }
    }
    
    func updateTime() {
        let diff = Int(endDate.timeIntervalSince(Date()))
        if diff <= 0 {
            timeLeft = "Expired"
        } else {
            let hours = diff / 3600
            let minutes = (diff % 3600) / 60
            let seconds = diff % 60
            timeLeft = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        }
    }
}

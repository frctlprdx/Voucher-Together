import Foundation

extension Update {
    static let dummyUpdate: [Update] = [
        Update(
            id: 1,
            userId: 1,
            userName: "Ivan",
            notifications: "Voucher Sushi Tei kamu akan segera berakhir dalam 1 jam!",
            opened: false,
            time: Date().addingTimeInterval(-1800) // 30 menit yang lalu
        ),
        Update(
            id: 2,
            userId: 1,
            userName: "Ivan",
            notifications: "Budi baru saja bergabung di grup Voucher Burger King kamu.",
            opened: true,
            time: Date().addingTimeInterval(-3600) // 1 jam yang lalu
        ),
        Update(
            id: 3,
            userId: 1,
            userName: "Ivan",
            notifications: "Selamat! Grup Voucher Imperial Kitchen sudah penuh. Silakan klaim diskonmu.",
            opened: false,
            time: Date().addingTimeInterval(-7200) // 2 jam yang lalu
        ),
        Update(
            id: 4,
            userId: 1,
            userName: "Ivan",
            notifications: "Ada voucher Asian baru yang mungkin kamu suka di dekatmu.",
            opened: true,
            time: Date().addingTimeInterval(-86400) // 1 hari yang lalu
        )
    ]
}

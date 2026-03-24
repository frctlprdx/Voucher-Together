import Foundation

// Tambahkan extension pada Model Voucher kamu
extension Voucher {
    // Data dummy untuk list
    static let dummyVouchers: [Voucher] = [
        Voucher(
            imageURL: "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/2b551767-9518-44e9-b158-6fb06b149890_restaurant-image_1674444263470.jpg?auto=format",
            title: "Sushi Tei",
            category: "Asian",
            host: "John Doe",
            hostImageURL: "https://cdn-icons-png.freepik.com/512/1144/1144760.png",
            discount: "Discount 25%",
            minimumPurchase: "Min. Purchase Rp250.000",
            currentPeople: 4,
            maxPeople: 6,
            description: "Lorem Ipsum Dolor Sit Amet",
            countdown: Date().addingTimeInterval(7200) // 2 jam dari sekarang
        ),
        Voucher(
            imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4WLbkykpoK3r57LXhTl8oIX__ktvsB3oBwg&s",
            title: "Burger King",
            category: "Western", // Contoh kategori berbeda
            host: "Budi",
            hostImageURL: "https://cdn-icons-png.freepik.com/512/1144/1144760.png",
            discount: "Discount 10%",
            minimumPurchase: "Min. Purchase Rp50.000",
            currentPeople: 1,
            maxPeople: 5,
            description: "Burger enak",
            countdown: Date().addingTimeInterval(7200) // 2 jam dari sekarang
        ),
        Voucher(
            imageURL: "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/c276026e-94fb-43fd-a2a1-087ff1b02ad9_Go-Biz_20240418_205927.jpeg",
            title: "Su Wah",
            category: "Asian",
            host: "John Doe",
            hostImageURL: "https://cdn-icons-png.freepik.com/512/1144/1144760.png",
            discount: "Discount 25%",
            minimumPurchase: "Min. Purchase Rp200.000",
            currentPeople: 2,
            maxPeople: 7,
            description: "Lorem Ipsum Dolor Sit Amet",
            countdown: Date().addingTimeInterval(7200) // 2 jam dari sekarang
        ),
        Voucher(
            imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR07qUOIJ8KXyE-Ajwth-iEE6R6yZKhceM6rQ&s",
            title: "Imperial Kitchen",
            category: "Asian",
            host: "John Doe",
            hostImageURL: "https://cdn-icons-png.freepik.com/512/1144/1144760.png",
            discount: "Discount 25%",
            minimumPurchase: "Min. Purchase Rp100.000",
            currentPeople: 3,
            maxPeople: 10,
            description: "Lorem Ipsum Dolor Sit Amet",
            countdown: Date().addingTimeInterval(7200) // 2 jam dari sekarang
        ),
    ]
}

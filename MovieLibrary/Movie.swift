import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let genre: Genre
    let rating: Double
}

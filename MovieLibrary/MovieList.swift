import Foundation

class MovieStorage: ObservableObject {
    @Published var selectedGenre : Genre = .fantasy
    @Published var sortingOption : SortingOption = .title
    
    let movies = [
        Movie(title: "Harry Potter", genre: .fantasy, rating: 8.2),
        Movie(title: "Twilight", genre: .fantasy, rating: 8.4),
        Movie(title: "Mad Max", genre: .fantasy, rating: 8.0),
        Movie(title: "Stranger Things", genre: .fantasy, rating: 8.7),
        Movie(title: "Warcraft", genre: .fantasy, rating: 8.3),
        Movie(title: "Interstellar", genre: .fantasy, rating: 8.6),
        Movie(title: "American Pie", genre: .comedy, rating: 6.2),
        Movie(title: "We're the Millers", genre: .comedy, rating: 8.2),
        Movie(title: "Charlie and the Chocolate Factory", genre: .comedy, rating: 9.2),
        Movie(title: "Shrek", genre: .comedy, rating: 7.8),
        Movie(title: "Groundhog Day", genre: .comedy, rating: 9.0),
        Movie(title: "The Hangover", genre: .comedy, rating: 7.7),
        Movie(title: "Avatar", genre: .action, rating: 8.0),
        Movie(title: "Thor", genre: .action, rating: 7.3),
        Movie(title: "Spider-Man", genre: .action, rating: 7.0),
        Movie(title: "Transformers", genre: .action, rating: 7.8),
        Movie(title: "Fast X", genre: .action, rating: 7.1),
        Movie(title: "John Wich", genre: .action, rating: 8.4),
        Movie(title: "Top Gun: Maverick", genre: .drama, rating: 8.3),
        Movie(title: "Lion", genre: .drama, rating: 8.0),
        Movie(title: "Hachi: A Dog's Tale", genre: .drama, rating: 9.0),
        Movie(title: "A Star Is Born", genre: .drama, rating: 9.5),
        Movie(title: "Billy Elliot", genre: .drama, rating: 8.7),
        Movie(title: "Good Will Hunting", genre: .drama, rating: 8.8)
    ]
    
    var filteredMovies: [Movie] {
        movies.filter { $0.genre == selectedGenre }
    }
    
    var sortedMovies: [Movie] {
        switch sortingOption {
        case .title:
            return filteredMovies.sorted {$0.title < $1.title }
        case .rating:
            return filteredMovies.sorted {$0.rating > $1.rating}
        }
    }
}

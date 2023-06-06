import SwiftUI

// TODO: add app icon

struct ContentView: View {
    
    @State private var selectedGenre : Genre = .fantasy
    @State private var sortingOption : SortingOption = .title
    
    // TODO: move to separate file and add movies
    private let movies = [
        Movie(title: "Harry Potter", genre: .fantasy, rating: 8.2),
        Movie(title: "Stranger Things", genre: .fantasy, rating: 8.7),
        Movie(title: "Interstellar", genre: .fantasy, rating: 8.6),
        Movie(title: "American Pie", genre: .comedy, rating: 6.2),
        Movie(title: "The Hangover", genre: .comedy, rating: 7.7),
        Movie(title: "Avatar", genre: .action, rating: 8.0),
        Movie(title: "Thor", genre: .action, rating: 7.3),
        Movie(title: "Spider-Man", genre: .action, rating: 7.0),
        Movie(title: "Top Gun: Maverick", genre: .drama, rating: 8.3),
        Movie(title: "House of the Dragon", genre: .drama, rating: 8.0),
        Movie(title: "Hachi: A Dog's Tale", genre: .drama, rating: 9.0)
    ]
    
    // TODO: move to separate file - part 2
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
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.blue
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            Picker("Genre", selection: $selectedGenre) {
                ForEach(Genre.allCases, id: \.self) { genre in
                    Text(genre.rawValue.capitalized).tag(genre)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack {
                Button("Sort by Title") {
                    sortingOption = .title
                }
                .padding()
                
                Button("Sort by Rating") {
                    sortingOption = .rating
                }
                .padding()
            }
            List(sortedMovies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.title)
                    Text(movie.genre.rawValue.capitalized)
                        .foregroundColor(.secondary)
                    Text("Raring: \(movie.rating, specifier: "%.1f")")
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

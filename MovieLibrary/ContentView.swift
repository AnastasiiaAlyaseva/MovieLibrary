import SwiftUI

struct ContentView: View {
    
    @State private var selectedGenre : Genre = .fantasy
    @State private var sortingOption : SortingOption = .title
    
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

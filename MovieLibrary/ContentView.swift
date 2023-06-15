import SwiftUI

struct ContentView: View {
    @StateObject private var movieStorage = MovieStorage()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.blue
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack {
            Picker("Genre", selection: $movieStorage.selectedGenre) {
                ForEach(Genre.allCases, id: \.self) { genre in
                    Text(genre.rawValue.capitalized).tag(genre)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack {
                Button("Sort by Title") {
                    movieStorage.sortingOption = .title
                }
                .padding()
                
                Button("Sort by Rating") {
                    movieStorage.sortingOption = .rating
                }
                .padding()
            }
            List(movieStorage.sortedMovies) { movie in
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

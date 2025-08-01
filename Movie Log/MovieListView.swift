//
//  MovieListView.swift
//  Movie Log
//
//  Created by matt on 7/29/25.
//
import SwiftUI

struct MovieListView: View {
    let movies: [Movie]
    
    var body: some View {
        LazyVStack() {
            ForEach(movies, id: \.id) { movie in 
                MovieView(movie: movie)
            }
        }
    }
}

#Preview {
    MovieListView(movies: [
        Movie(
            id: "1",
            title: "Fitzcarraldo",
            year: 1982, 
            director: "Werner Herzog",
            posterUrl: "https://kagi.com/proxy/815BPyrUd7L._UF1000,1000_QL80_.jpg?c=CXPfL3-FqybbvZNQU82_BGSCqYZMz5YT_CgNKn5TDDVMoNATIPyBJIhsmjSZWvJHxnehq5q1L91KI7dklIZezWcMWDktcZVY6F39zOIwZCXOsBE8fuzkaz2POS4Bo0CW",
            reviews: [
                Review(id: "1", authorName: "Matt", letterGrade: "B+", date: Date()),
                Review(id: "2", authorName: "Reba", letterGrade: "D", date: Date())
            ]
        ),
        Movie(
            id: "2",
            title: "Babe",
            year: 1995, 
            director: "Chris Noonan",
            posterUrl: "https://kagi.com/proxy/s-l1200.jpg?c=V3Q1Ja5YWMDYYHOhb013QQjYRQLP7AsaBPmVcsbLAgBrQTPXHCqv6uBF-orjVzA9pv-51A4T5IIU77RHApAmc3qF7Tqor6a14eDwwnHRJ7w%3D",
            reviews: [
                Review(id: "3", authorName: "Matt", letterGrade: "A+", date: Date()),
                Review(id: "4", authorName: "Reba", letterGrade: "A+", date: Date())
            ]
        )
    ])
}

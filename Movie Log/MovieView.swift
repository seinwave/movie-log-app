//
//  ReviewView.swift
//  Movie Log
//
//  Created by matt on 7/29/25.
//

import SwiftUI

public struct Movie {
    let id: String
    let title: String
    let year: Double
    let director: String
    let posterUrl: String
    let reviews: [Review]
}

public struct Review {
    let id: String
    let authorName: String
    let letterGrade: String  // F- to A+
    let date: Date
}

public struct MovieView: View {
    let movie: Movie
    public var body: some View {

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .top, spacing: 16) {

                    // POSTER
                    AsyncImage(url: URL(string: movie.posterUrl)) {
                        image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)

                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .overlay(
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                            )
                    }
                    .frame(width: 120, height: 180)
                    .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .lineLimit(2)

                        HStack {
                            Text(movie.director)
                            .font(.caption)
                            Text(String(Int(movie.year)))
                            .font(.caption)
                        }

                        LazyVStack(alignment: .leading) {
                            ForEach(movie.reviews, id: \.id) { review in
                                ReviewCard(review: review)
                            }
                        }

                    }

                    Spacer()

                }

            }
        }

    }

}

struct ReviewCard: View {
    let review: Review
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    private func gradeColor(for grade: String) -> Color {
        switch grade {
        case "A+", "A", "A-":
            return .green
        case "B+", "B", "B-":
            return .blue
        case "C+", "C", "C-":
            return .orange
        case "D+", "D", "D-":
            return .red
        case "F+", "F", "F-":
            return .red
        default:
            return .gray
        }
    }

    var body: some View {
        HStack {
            Text(review.authorName)
                .font(.subheadline)
                .fontWeight(.medium)

            Spacer()

            Text(review.letterGrade)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(gradeColor(for: review.letterGrade))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .cornerRadius(4)

            Spacer()

            Text(Self.formatter.string(from: review.date))
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .cornerRadius(4)
        }

    }

}

#Preview {
    MovieView(
        movie: Movie(
            id: "1",
            title: "Fitzcarraldo",
            year: 1982, 
            director: "Werner Herzog",
            posterUrl: "https://kagi.com/proxy/815BPyrUd7L._UF1000,1000_QL80_.jpg?c=CXPfL3-FqybbvZNQU82_BGSCqYZMz5YT_CgNKn5TDDVMoNATIPyBJIhsmjSZWvJHxnehq5q1L91KI7dklIZezWcMWDktcZVY6F39zOIwZCXOsBE8fuzkaz2POS4Bo0CW",
            reviews: [
                Review(id: "1", authorName: "Matt", letterGrade: "B+", date: Date()),
                Review(id: "2", authorName: "Reba", letterGrade: "D", date: Date())
            ]
        )
    )
}

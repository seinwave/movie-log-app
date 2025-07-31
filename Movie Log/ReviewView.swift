//
//  ReviewView.swift
//  Movie Log
//
//  Created by matt on 7/29/25.
//

import SwiftUI

struct Movie {
    let id: String
    let title: String
    let year: Double
    let director: String
    let posterUrl: String
}

struct Review {
    let id: String
    let authorName: String
    let letterGrade: String  // F- to A+
    let date: Date
}

struct MovieView: View {
    let movie: Movie
    let reviews: [Review]

    var body: some View {

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
                            Text(String(Int(movie.year)))
                        }

                        LazyVStack(alignment: .leading) {
                            ForEach(reviews, id: \.id) { review in
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

    var body: some View {
        HStack {
            Text(review.authorName)
                .font(.subheadline)
                .fontWeight(.medium)

            Text(review.letterGrade)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .cornerRadius(4)

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
            title: "Fitzcaraldo",
            year: 1971,
            director: "Werner Herzog",
            posterUrl: ""

        ),
        reviews: [
            Review(id: "1", authorName: "Matt", letterGrade: "B+", date: Date())
        ]
    )
}

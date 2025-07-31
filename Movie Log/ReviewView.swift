//
//  ReviewView.swift
//  Movie Log
//
//  Created by matt on 7/29/25.
//

import SwiftUI

let dummyReview = [
    "title": "A Simple Man",
    "date": "10-23-2021",
    "grade": "A+",
]

struct ReviewView: View {
    var body: some View {
        // TODO: actually sketch out the component
        VStack {
            Text(dummyReview["title"] ?? " ")
                .padding()
            HStack {
                Text(dummyReview["date"] ?? " ")
                    .padding()
                Text(dummyReview["grade"] ?? " ")
                    .padding()
            }
        }
        .border(.gray)
        .cornerRadius(3)
    }
}

#Preview {
    ReviewView()
}

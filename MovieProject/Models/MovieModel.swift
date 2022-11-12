//
//  MovieModel.swift
//  MovieProject
//
//  Created by apprenant1 on 03/10/2022.
//

import Foundation

// MODEL API
//"items": [
//        {
//            "id": "tt10731256",
//            "rank": "1",
//            "rankUpDown": "+6",
//            "title": "Don't Worry Darling",
//            "fullTitle": "Don't Worry Darling (2022)",
//            "year": "2022",
//            "image": "https://m.media-amazon.com/images/M/MV5BMzFkMWUzM2ItZWFjMi00NDY0LTk2MDMtZDhkMDE2MjRlYmZlXkEyXkFqcGdeQXVyNTAzNzgwNTg@._V1_Ratio0.6716_AL_.jpg",
//            "crew": "Olivia Wilde (dir.), Florence Pugh, Harry Styles",
//            "imDbRating": "6.3",
//            "imDbRatingCount": "22305"
//        },

struct MovieModel: Codable {
    var items: [Item]
}

// MARK: - Item
struct Item: Identifiable, Codable {
    var id: String
    var rank: String
    var rankUpDown: String
    var title: String
    var image: String
}


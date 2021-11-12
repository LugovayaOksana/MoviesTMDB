//
//  Review.swift
//  MoviesApp
//
//  Created by Оксана on 11.11.2021.
//

import Foundation

struct ReviewResponse: Codable {
    var results: [Review]
}

struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}

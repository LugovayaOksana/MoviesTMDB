//
//  MovieReviewsManager.swift
//  MoviesApp
//
//  Created by Оксана on 11.11.2021.
//

import SwiftUI

final class MovieReviewManager: ObservableObject {
    @Published var review = [Review]()
    
    private var movie: Movie
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func getMovieReviews(){
        getReview(for: movie)
    }
    
    private func getReview(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/reviews?api_key=\(API.key)"
        NetworkManager<ReviewResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let response):
                self.review = response.results
            case .failure(let err):
                print(err)
            }
        }
    }
}

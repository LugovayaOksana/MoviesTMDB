//
//  MovieReviewView.swift
//  MoviesApp
//
//  Created by Оксана on 12.11.2021.
//

import Foundation
import SwiftUI

struct MovieReviewView: View {
    var movie: Movie
    
    @ObservedObject var moviewRevieMng: MovieReviewManager
    
    init(movie: Movie){
        self.movie = movie
        self.moviewRevieMng = MovieReviewManager(movie: movie)
        
        UITableView.appearance().separatorStyle  = .none
        UITableView.appearance().backgroundColor = .clear
        
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            List {
                ForEach(moviewRevieMng.review)  {review in
                    VStack  {
                        Text(review.author ?? "")
                            .font(.title)
                            .bold()
                        Text(review.content ?? "")
                            .font(.body)
                            .lineLimit(nil)
                    }
                    .foregroundColor(.white)
                    .listRowBackground(Color.clear)
                }
            }.onAppear{
                moviewRevieMng.getMovieReviews()
            }.padding(.horizontal, 32)
        }.edgesIgnoringSafeArea(.all)
    }
}

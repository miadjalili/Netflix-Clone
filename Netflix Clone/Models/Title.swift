//
//  Movie.swift
//  Netflix Clone
//
//  Created by Miad Jalili on 20.06.2022.
//

import Foundation


struct TrendingTitleResponse: Codable {
    let results : [Title]
}


struct Title:Codable{
    
      let id: Int
      let voteAverage: Double
      let overview: String?
      let releaseDate: String?
      let voteCount: Int
      let adult: Bool?
      let backdropPath: String?
      let video: Bool?
      let genreIDS: [Int]
      let title: String?
      let originalTitle: String?
      let posterPath: String
      let popularity: Double?
      let firstAirDate, name, originalName: String?
      let originCountry: [String]?
    
    
    
      enum CodingKeys: String, CodingKey {
          case id
          case voteAverage = "vote_average"
          case overview
          case releaseDate = "release_date"
          case voteCount = "vote_count"
          case adult
          case backdropPath = "backdrop_path"
          case video
          case genreIDS = "genre_ids"
          case title
          case originalTitle = "original_title"
          case posterPath = "poster_path"
          case popularity
          case firstAirDate = "first_air_date"
          case name
          case originalName = "original_name"
          case originCountry = "origin_country"
      }
}





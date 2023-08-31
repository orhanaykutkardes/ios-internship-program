//
//  CleanHomeViewModel.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import Foundation

struct CleanHomeViewModel {
    
    struct MoviesRequest {
        
    }
    
    struct MoviesResponse: Decodable {
        
        let page, totalResults, totalPages: Int?
        let results: [MovieResult]?

        enum CodingKeys: String, CodingKey {
            case page
            case totalResults = "total_results"
            case totalPages = "total_pages"
            case results
        }
        
        struct MovieResult: Codable {
            let popularity: Double?
            let voteCount: Int?
            let video: Bool?
            let posterPath: String?
            let id: Int?
            let adult: Bool?
            let backdropPath: String?
            let originalTitle: String?
            let genreIDS: [Int]?
            let title: String?
            let voteAverage: Double?
            let overview, releaseDate: String?

            enum CodingKeys: String, CodingKey {
                case popularity
                case voteCount = "vote_count"
                case video
                case posterPath = "poster_path"
                case id, adult
                case backdropPath = "backdrop_path"
                case originalTitle = "original_title"
                case genreIDS = "genre_ids"
                case title
                case voteAverage = "vote_average"
                case overview
                case releaseDate = "release_date"
            }
        }

        enum OriginalLanguage: String, Codable {
            case en = "en"
            case ko = "ko"
        }
    }
    
    struct MoviesViewModel {
        let title: String
        let subtitle: String
        let posterPath: String
    }
}

//
//  CleanPresenter.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import Foundation

protocol MoviesPresentationLogic {
    func presentMovies(response: [CleanHomeViewModel.MoviesResponse.MovieResult])
}

final class CleanHomePresenter: MoviesPresentationLogic {
    
    weak var viewController: CleanDisplayLogic?
    
    func presentMovies(response: [CleanHomeViewModel.MoviesResponse.MovieResult]) {
        
        var displayMovies: [CleanHomeViewModel.MoviesViewModel] = []
        
        for movie in response {
            let movieItem = CleanHomeViewModel.MoviesViewModel(title: movie.title ?? "",
                                                            subtitle: movie.releaseDate ?? "",
                                                            posterPath: movie.posterPath ?? "")
            displayMovies.append(movieItem)
        }
        
        viewController?.fetchedMovieResult(response: displayMovies)
    }
}

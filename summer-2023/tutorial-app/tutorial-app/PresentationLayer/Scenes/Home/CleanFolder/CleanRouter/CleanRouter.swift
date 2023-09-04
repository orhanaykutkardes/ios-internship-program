//
//  CleanRouter.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 4.09.2023.
//

import UIKit

protocol MoviesRoutingLogic {
    func routeToMovieDetail(index: Int)
}

protocol MovieDataPassing {
    var dataStore: MoviesDataStore? { get }
}

class CleanHomeRouter: NSObject, MoviesRoutingLogic, MovieDataPassing {

    weak var viewController: CleanHomeViewController?
    var dataStore: MoviesDataStore?
    
    func routeToMovieDetail(index: Int) {
        let nextViewController = MovieDetailViewController()
        nextViewController.navigationTitle = dataStore?.movies?[index].title
        nextViewController.movieID = dataStore?.movies?[index].id
        viewController?.present(nextViewController, animated: true)
    }
    
}

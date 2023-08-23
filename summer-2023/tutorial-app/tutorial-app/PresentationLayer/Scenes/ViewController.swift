//
//  ViewController.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji on 10.08.2023.
//

import UIKit
import Kingfisher

final class ViewController: UIViewController {
    
    let customTableView: UITableView = UITableView()
    
    private let networkManager: NetworkManager = NetworkManager()
    fileprivate(set) var popularMovies: [MovieResult]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        prepareUI()
        initTableView()
        loadPopularMovies()
    }
    
    func loadPopularMovies() {
        networkManager.fetchPopularMovies { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieResponse):
                if let popularMovies = movieResponse.results {
                    strongSelf.popularMovies = popularMovies
                    debugPrint(popularMovies)
                    //strongSelf.delegate?.didUpdatePopularMovies()
                    strongSelf.customTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func prepareUI() {
        view.addSubview(customTableView)
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTableView.topAnchor.constraint(equalTo: view.topAnchor),
            customTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func initTableView() {
        customTableView.delegate = self
        customTableView.dataSource = self
        customTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "DefaultCell")
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popularMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as? CustomTableViewCell
        cell?.label.text = popularMovies?[indexPath.row].title
        cell?.sublabel.text = popularMovies?[indexPath.row].releaseDate
        let str = popularMovies?[indexPath.row].posterPath ?? ""
        cell?.configureImagePath(posterPath: "https://image.tmdb.org/t/p/w500" + str)
        return cell ?? UITableViewCell()
    }
    
    
}


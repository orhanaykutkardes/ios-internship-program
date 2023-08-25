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
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Popular Movies"
        
        prepareUI()
        initTableView()
        loadPopularMovies()
        viewModelBindings()
    }
    
    func loadPopularMovies() {
        viewModel.loadPopularMoview()
    }
    
    private func viewModelBindings() {
        viewModel.reloadTableViewClosure = { [weak self] in
            self?.customTableView.reloadData()
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
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as? CustomTableViewCell
        
        cell?.viewModel = CustomCellViewModel(title: viewModel.movie(at: indexPath.row)?.title ?? "",
                                              subtitle: viewModel.movie(at: indexPath.row)?.releaseDate ?? "",
                                              posterPath: viewModel.movie(at: indexPath.row)?.posterPath ?? "")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = MovieDetailViewController()
        nextViewController.indexPathRow = indexPath.row
        nextViewController.navigationTitle = viewModel.movie(at: indexPath.row)?.title ?? ""
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        } else if indexPath.row == 1 {
            return 400
        } else {
            return 50
        }
    }
}

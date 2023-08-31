//
//  CleanHomeViewController.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import UIKit

protocol CleanDisplayLogic: AnyObject {
    func fetchedMovieResult(response: [CleanHomeViewModel.MoviesViewModel])
}

final class CleanHomeViewController: UIViewController, CleanDisplayLogic {
    
    let customTableView: UITableView = UITableView()
    
    var interactor: HomeBusinessLogic?
    
    var moviesDataModel = [CleanHomeViewModel.MoviesViewModel]()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = CleanHomeInteractor()
        let presenter = CleanHomePresenter()
        //let router = Clea()
        viewController.interactor = interactor
        //viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        //router.viewController = viewController
        //router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareUI()
        initTableView()
        interactor?.fetchMovies()
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
    
    func fetchedMovieResult(response: [CleanHomeViewModel.MoviesViewModel]) {
        moviesDataModel = response
        customTableView.reloadData()
    }

}

extension CleanHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as? CustomTableViewCell
        
        cell?.viewModel = CustomCellViewModel(title: moviesDataModel[indexPath.row].title ?? "",
                                              subtitle:  moviesDataModel[indexPath.row].subtitle ?? "",
                                              posterPath:  moviesDataModel[indexPath.row].title ?? "")
        return cell ?? UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let nextViewController = MovieDetailViewController()
        nextViewController.navigationTitle = viewModel.movie(at: indexPath.row)?.title ?? ""
        nextViewController.movieID = viewModel.movie(at: indexPath.row)?.id ?? 0
        self.navigationController?.pushViewController(nextViewController, animated: true)
         */
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

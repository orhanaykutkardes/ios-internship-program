//
//  ViewController.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji on 10.08.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    let customTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        prepareUI()
        initTableView()
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as? CustomTableViewCell
        cell?.label.text = String(indexPath.row)
        cell?.sublabel.text = "created sublabel for index \(indexPath.row)"
        return cell ?? UITableViewCell()
    }
    
    
}


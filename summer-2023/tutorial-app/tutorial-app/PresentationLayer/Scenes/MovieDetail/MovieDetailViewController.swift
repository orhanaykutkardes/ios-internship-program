//
//  MovieDetailViewController.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var indexPathRow: Int?
    var navigationTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = navigationTitle ?? "Empty"
        view.backgroundColor = .red
        debugPrint(indexPathRow ?? 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

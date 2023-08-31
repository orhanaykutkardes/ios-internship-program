//
//  CustomHeaderCell.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import UIKit
import Kingfisher

final class CustomHeaderCell: UITableViewCell {
    
    private let iconView: UIImageView = UIImageView()
    private var ImagePath: String = "https://image.tmdb.org/t/p/w500"
    
    var viewModel: CustomHeaderCellViewModel? {
        didSet {
            guard let data = viewModel else { return }
            configureCell(data: data)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI() {
        
        addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
        iconView.layer.cornerRadius = 12
        iconView.clipsToBounds = true
        iconView.layer.masksToBounds = true
      
    }
    
    private func configureCell(data: CustomHeaderCellViewModel) {
        iconView.kf.setImage(with: URL(string: ImagePath + data.iconURL))
    }
}

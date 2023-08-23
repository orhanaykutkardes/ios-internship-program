//
//  CustomTableViewCell.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji on 10.08.2023.
//

import UIKit
import Kingfisher

final class CustomTableViewCell: UITableViewCell {
    
    let iconView: UIImageView = UIImageView()
    let label: UILabel = UILabel()
    let sublabel: UILabel = UILabel()
    
    var ImagePath: String = ""
    
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
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 24),
            iconView.widthAnchor.constraint(equalToConstant: 24)
        ])
        iconView.layer.cornerRadius = 12
        iconView.clipsToBounds = true
        iconView.layer.masksToBounds = true
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4)
        ])
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .green
        
        addSubview(sublabel)
        sublabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sublabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            sublabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            sublabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
            sublabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
        
        sublabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        sublabel.textColor = .cyan
    }
    
    func configureImagePath(posterPath: String) {
        iconView.kf.setImage(with: URL(string: posterPath))
    }
}


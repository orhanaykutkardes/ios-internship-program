//
//  CustomDetailCell.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import UIKit
import Kingfisher

final class CustomDetailCell: UITableViewCell {
    
    private let overlayView: UIView = UIView()
    
    private let title: UILabel = UILabel()
    private let releaseDate: UILabel = UILabel()
    private let overView: UILabel = UILabel()
    
    var viewModel: CustomDetailCellViewModel? {
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
        
        addSubview(overlayView)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            overlayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            overlayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overlayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
        
        overlayView.backgroundColor = .green.withAlphaComponent(0.2)
        
        overlayView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            title.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        overlayView.addSubview(releaseDate)
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            releaseDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            releaseDate.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16),
            releaseDate.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            releaseDate.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        overlayView.addSubview(overView)
        overView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overView.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 8),
            overView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16),
            overView.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
        ])
        overView.numberOfLines = 0
    }
    
    
    func configureCell(data: CustomDetailCellViewModel) {
        title.text = data.title
        releaseDate.text = data.releaseDate
        overView.text = data.overView
    }
}

//
//  DFCategoriesCollectionViewCell.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

final class DFCategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DFCategoriesCollectionViewCell"
//    private let model = DFCategoriesCollectionViewCellModel()

    
//    private lazy var categoriesButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Напитки", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        button.setTitleColor(.red, for: .normal)
//        button.backgroundColor = .clear
//        return button
//    }()
    
    private lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hagbnrb"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 20

        setTextConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoriesLabel.text = nil
    }
    
    public func configure(with viewModel: String) {
        categoriesLabel.text = viewModel
    }
    
    private func setTextConstraints() {
        addSubview(categoriesLabel)
        NSLayoutConstraint.activate([
            categoriesLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoriesLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
}

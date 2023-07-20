//
//  DFCategoriesCollectionViewCell.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

final class DFCategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DFCategoriesCollectionViewCell"
    private let model = DFCategoriesCollectionViewCellModel()
    
    private lazy var categoriesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Напитки", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        return button
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
    
    private func setTextConstraints() {
        addSubview(categoriesButton)
        
        NSLayoutConstraint.activate([
            categoriesButton.topAnchor.constraint(equalTo: topAnchor),
            categoriesButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoriesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            categoriesButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}

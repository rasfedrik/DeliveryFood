//
//  DFHeaderCategoriesReusebleView.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 27.06.2023.
//

import UIKit

class DFHeaderCategoriesReusebleView: UICollectionReusableView {
    
    static let identifier = "DFHeaderCategoriesReusebleView"
    private let categoriesCollectionView = DFCategoriesCollectionView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        addSubview(categoriesCollectionView)
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoriesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}

//
//  DFHeaderSpecialOffersReusebleView.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

class DFHeaderSpecialOffersReusebleView: UICollectionReusableView {
    
    static let identifier = "DFHeaderSpecialOffersReusebleView"
    private let specialOffersCollectionView = DFSpecialOffersCollectionView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        addSubview(specialOffersCollectionView)
        
        NSLayoutConstraint.activate([
            specialOffersCollectionView.topAnchor.constraint(equalTo: topAnchor),
            specialOffersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            specialOffersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            specialOffersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}

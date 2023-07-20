//
//  DFSpecialOffersCollectionViewCell.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 23.06.2023.
//

import UIKit

final class DFSpecialOffersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DFSpecialOffersCollectionViewCell"
    private let model = DFSpecialOffersCollectionViewCellModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemRed
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

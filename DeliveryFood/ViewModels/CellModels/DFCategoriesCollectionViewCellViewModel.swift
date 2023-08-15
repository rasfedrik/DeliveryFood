//
//  DFCategoriesCollectionViewCellViewModel.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 10.08.2023.
//

import Foundation

final class DFCategoriesCollectionViewCellViewModel {
    
    public let strCategory: String
    
    init(strCategory: String) {
        self.strCategory = strCategory
    }
    
}

extension DFCategoriesCollectionViewCellViewModel: Hashable, Equatable {
    
    static func == (lhs: DFCategoriesCollectionViewCellViewModel, rhs: DFCategoriesCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(strCategory)
    }
}

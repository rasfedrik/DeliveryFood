//
//  DFCategories.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 25.07.2023.
//

import Foundation

// MARK: - DFCategories
struct DFCategories: Codable {
    let meals: [DFMeal]
}

struct DFMeal: Codable {
    let strCategory: String
}





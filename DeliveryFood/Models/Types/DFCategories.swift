//
//  DFCategories.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 25.07.2023.
//

import Foundation

// MARK: - Categories
struct Categories: Codable {
    let meals: [Meal]

    struct Meal: Codable {
        let strCategory: String
    }
}





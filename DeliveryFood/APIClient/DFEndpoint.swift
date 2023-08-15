//
//  DFEndpoint.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 25.07.2023.
//

import Foundation

@frozen enum DFEndpoint: String {
    
    case mealDetails = "lookup.php?i=52772"
    case listCategories = "list.php?c=list"
    case filterCategories = "filter.php"

}

//
//  DFMenuCollectionViewCellViewModel.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 14.08.2023.
//

import UIKit

final class DFMenuCollectionViewCellViewModel {
    
    public var mealImageURL: URL?
    public var textLabel: String
    public var descriptionDishLabel: String
    public var nameCartButton: String
    
    init(
        mealImageURL: URL?,
        textLabel: String,
        descriptionDishLabel: String,
        nameCartButton: String
    ) {
        self.mealImageURL = mealImageURL
        self.textLabel = textLabel
        self.descriptionDishLabel = descriptionDishLabel
        self.nameCartButton = nameCartButton
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let urlImage = mealImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        DFImageLoader.shared.downloadImage(urlImage, completion: completion)
    }
    
}

extension DFMenuCollectionViewCellViewModel: Hashable, Equatable {
    static func == (lhs: DFMenuCollectionViewCellViewModel, rhs: DFMenuCollectionViewCellViewModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(nameCartButton)
        hasher.combine(textLabel)
        hasher.combine(descriptionDishLabel)
        hasher.combine(mealImageURL)
    }
}

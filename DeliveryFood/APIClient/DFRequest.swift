//
//  DFRequest.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 25.07.2023.
//

import Foundation

final class DFRequest {
    
    private struct Constants {
        static let baseURL = "https://www.themealdb.com/api/json/v1/1"
    }
    
    private let endpoint: DFEndpoint
//    private let pathComponents: [String]
//    private let queryParameters: [URLQueryItem]

    private var urlString: String {
        var string = Constants.baseURL
        string += "/\(endpoint.rawValue)"
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    public init(
        endpoint: DFEndpoint
//        pathComponents: [String] = [],
//        queryParameters: [URLQueryItem] = []
    ){
        self.endpoint = endpoint
//        self.pathComponents = pathComponents
//        self.queryParameters = queryParameters
    }
}

extension DFRequest {
    static let mealDetailsRequest = DFRequest(endpoint: .mealDetails)
    static let categoriesRequest = DFRequest(endpoint: .listCategories)
}

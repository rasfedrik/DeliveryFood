//
//  DFService.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 25.07.2023.
//

import Foundation

final class DFService {
    
    static let shared = DFService()
    
    private init(){}
    
    enum DFServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    public func execute<T: Codable>(
        _ request: DFRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(DFServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(DFServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    private func request(from dfRequest: DFRequest) -> URLRequest? {
        guard let url = dfRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = dfRequest.httpMethod
        return request
    }
}

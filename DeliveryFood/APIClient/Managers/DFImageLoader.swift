//
//  DFImageLoader.swift
//  DeliveryFood
//
//  Created by Семён Беляков on 14.08.2023.
//

import Foundation

final class DFImageLoader {

    static let shared = DFImageLoader()
    
    private var imageDataCashe = NSCache<NSString, NSData>()
    
    private init(){}
    
    public func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let key = url.absoluteString as NSString
        
        if let data = imageDataCashe.object(forKey: key as NSString) {
            completion(.success(data as Data))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badURL)))
                return
            }
            
            let value = data as NSData
            self?.imageDataCashe.setObject(value, forKey: key)
            
            completion(.success(data))
        }
        task.resume()
    }
}





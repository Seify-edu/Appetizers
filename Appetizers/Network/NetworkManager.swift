//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Roman Smirnov on 03.07.2023.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}

    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizersURL) else {
            throw APError.invalidURL
        } 
        
        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizeResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        if let cachedImage = cachedImage(from: urlString) {
            completed(cachedImage)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.saveCachedImage(from: urlString, image: image)
            completed(image)
        }
        task.resume()
    }
    
    func cachedImage(from urlString: String) -> UIImage? {
        let cacheKey = NSString(string: urlString)
        return cache.object(forKey: cacheKey)
    }
    
    func saveCachedImage(from urlString: String, image: UIImage) {
        let cacheKey = NSString(string: urlString)
        cache.setObject(image, forKey: cacheKey)
    }
}

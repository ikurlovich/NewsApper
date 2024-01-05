//
//  ApiManager.swift
//  NewsApper
//
//  Created by Илья Курлович on 19.12.2023.
//

import Foundation


final class ApiManager {
    private static let apiKey = "fc475b5d475f41febb8b94fd7a501e88"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "everything"
    
    // Create url path and make request
    static func getNews(completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=" + apiKey
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            handleResponse(data: data, error: error, completion: completion)
        }
        
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            } else {
                print("Error get data")
            }
        }
        
        session.resume()
    }
    
    // Handle responce
    private static func handleResponse(data: Data?, error: Error?, completion: @escaping (Result<[ArticleResponseObject], Error>) -> ()) {
        
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self, from: data)
                
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError ))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}


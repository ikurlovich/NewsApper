//
//  NewsResponseObject.swift
//  NewsApper
//
//  Created by Илья Курлович on 19.12.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}

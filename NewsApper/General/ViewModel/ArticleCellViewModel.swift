//
//  ArticleCellViewModel.swift
//  NewsApper
//
//  Created by Илья Курлович on 19.12.2023.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleResponseObject) {
        title = article.title
        description = article.description
        date = article.publishedAt
    }
}

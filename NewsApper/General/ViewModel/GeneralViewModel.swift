//
//  GeneralViewModel.swift
//  NewsApper
//
//  Created by Илья Курлович on 19.12.2023.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    
    // MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    private var articles: [ArticleResponseObject] = [] {
        didSet {
            reloadData?()
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
        // TODO: load data
        
        setupMockObjects()
    }
    
    private func setupMockObjects() {
        articles = [
            ArticleResponseObject(title: "First object title", description: "First object description in the mock object", urlToImage: "...", publishedAt: "23.03.2023"),
            ArticleResponseObject(title: "Second object title", description: "Second object description in the mock object", urlToImage: "...", publishedAt: "23.03.2023"),
            ArticleResponseObject(title: "Third object title", description: "Third object description in the mock object", urlToImage: "...", publishedAt: "23.03.2023"),
            ArticleResponseObject(title: "Fourth object title", description: "Fourth object description in the mock object", urlToImage: "...", publishedAt: "23.03.2023"),
            ArticleResponseObject(title: "Fifth object title", description: "Fifth object description in the mock object", urlToImage: "...", publishedAt: "23.03.2023")
            
        ]
    }
}

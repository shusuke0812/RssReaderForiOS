//
//  ArticleViewModel.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/30.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

protocol ArticleViewModelDelegate: AnyObject{
    func didSuccessGetArticles()
    func didFailedGetArticles(errorMessage: String)
}

class ArticleViewModel: NSObject {
    private let articleRepository: ArticlesRepositoryProtocol
    var articles: [Item] = []
    internal weak var delegate: ArticleViewModelDelegate?
    
    init(articleRepository: ArticlesRepositoryProtocol) {
        self.articleRepository = articleRepository
    }
}

extension ArticleViewModel {
    func loadArticles(request: URLRequest) {
        self.articleRepository.getArticles(request: request, completion: { (response) in
            switch response {
            case .success(let items):
                self.articles = items
                self.delegate?.didSuccessGetArticles()
            case .failure(let error):
                print("DEBUG： \(error)")
                self.delegate?.didFailedGetArticles(errorMessage: "note記事の取得に失敗しました")
            }
        })
    }
    func loadArticles(request: URL) {
        self.articleRepository.getArticles(requestRssUrl: request) { response in
            switch response {
            case .success(let items):
                print(items)
            case .failure(let error):
                print("DEBUG： \(error)")
                self.delegate?.didFailedGetArticles(errorMessage: "note記事の取得に失敗しました")
            }
        }
    }
}

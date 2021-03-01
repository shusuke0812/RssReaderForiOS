//
//  ArticlePresenter.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/3/1.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

protocol ArticlePresenterProtocol {
    /// セルの記事情報取得
    func article(forRow row: Int) -> Item?
    /// TableViewのセルを選択した時の処理
    func didSelectRow(at indexPath: IndexPath)
}

class ArticlePresenter: ArticlePresenterProtocol {
    private weak var view: ArticleViewProtocol!
    private let router: ArticleRouterRrotocol
    
    private(set) var articles: [Item] = []
    
    init(view: ArticleViewProtocol, router: ArticleRouterRrotocol) {
        self.view = view
        self.router = router
    }
}
// MARK: - Presenter Method
extension ArticlePresenter {
    func article(forRow row: Int) -> Item? {
        return self.articles[row]
    }
    func didSelectRow(at indexPath: IndexPath) {
        guard let article = self.article(forRow: indexPath.row) else { return }
        self.router.transitionToArticleDetail(article: article)
    }
}

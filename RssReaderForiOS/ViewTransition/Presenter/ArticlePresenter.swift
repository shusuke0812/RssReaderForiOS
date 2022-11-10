//
//  ArticlePresenter.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/3/1.
//  Copyright © 2021 shusuke. All rights reserved.
//

/**
 * Routerに対して画面遷移の指示を出すクラス
 * - view, routerを保持
 * - 補足：routerを保持するクラスはViewControllerでも良い
 */

import UIKit

protocol ArticlePresenterProtocol {
    func didSelectRow(article: Item)
}

class ArticlePresenter: ArticlePresenterProtocol {
    private weak var view: ArticleViewProtocol!
    private let router: ArticleRouterRrotocol
    
    init(view: ArticleViewProtocol, router: ArticleRouterRrotocol) {
        self.view = view
        self.router = router
    }
}
// MARK: - Presenter Method
extension ArticlePresenter {
    func didSelectRow(article: Item) {
        self.router.transitionToArticleDetail(article: article)
    }
}

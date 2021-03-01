//
//  ArticleDetailRouter.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/3/1.
//  Copyright © 2021 shusuke. All rights reserved.
//

import UIKit

protocol ArticleRouterRrotocol: AnyObject {
    /// 記事詳細画面に遷移
    /// - Parameter article: 記事情報
    func transitionToArticleDetail(article: Item)
}

class ArticleRouter: ArticleRouterRrotocol {
    private(set) weak var view: ArticleViewProtocol!
    
    init(view: ArticleViewProtocol) {
        self.view = view
    }
}
// MARK: - Router Method
extension ArticleRouter {
    func transitionToArticleDetail(article: Item) {
        let s = UIStoryboard(name: "ArticleDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! ArticleDetailViewController
        vc.article = article
        self.view.pushViewController(vc, animated: true)
    }
}

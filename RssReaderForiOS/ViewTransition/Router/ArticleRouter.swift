//
//  ArticleDetailRouter.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/3/1.
//  Copyright © 2021 shusuke. All rights reserved.
//

/**
 * 画面遷移を行うクラス
 * - 遷移先のViewControllerを生成して画面遷移させるメソッドを記述
 */

import UIKit

protocol ArticleRouterRrotocol: AnyObject {
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
        /* 遷移先にpresenterがあればココに追加する */
        self.view.pushViewController(vc, animated: true)
    }
}

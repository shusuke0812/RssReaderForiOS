//
//  ArticleViewModel.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/30.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ArticleViewModel: NSObject {
    /// note記事一覧のリポジトリクラス
    private let articleRepository: ArticlesRepositoryProtocol
    
    /// note記事一覧
    internal var articles: [Item] = []
    
    init(articleRepository: ArticlesRepositoryProtocol) {
        self.articleRepository = articleRepository
        super.init()
    }
}

extension ArticleViewModel {
    /// note記事を読み込む
    // TODO: 引数どうすべきか？
    func loadArticles() {
        self.articleRepository.getArticles(urlString: CommonData.ApiUrl.noteArticle, completion: { (response) in
            switch response {
            case .success(let items):
                DispatchQueue.main.async {
                    [weak self] in
                    guard let me = self else { return }
                    me.articles = items
                }
            case .failure(let error):
                print("DEBUG： 記事の取得に失敗しました")
                print(error)
            }
        })
    }
}

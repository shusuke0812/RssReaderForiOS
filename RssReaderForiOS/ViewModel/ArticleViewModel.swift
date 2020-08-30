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
    
    init(articleRepository: ArticlesRepositoryProtocol) {
        self.articleRepository = articleRepository
        super.init()
    }
}

extension ArticleViewModel {
    /// note記事を取得する
}

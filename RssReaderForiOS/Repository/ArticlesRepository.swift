//
//  ArticlesRepository.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/27.
//  Copyright © 2020 shusuke. All rights reserved.
//

protocol ArticlesRepositoryProtocol {
    /// Note記事を取得する
    func getArticles(urlString: String, completion: @escaping (Result<Articles, Error>) -> Void)
}


/// Note記事のRSSを取得するクラス
class ArticlesRepository: ArticlesRepositoryProtocol {
}

extension ArticlesRepository {
    /// Note記事を取得する
    func getArticles(urlString: String, completion: @escaping (Result<Articles, Error>) -> Void) {
        <#code#>
    }
}

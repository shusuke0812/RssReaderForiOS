//
//  ArticlesRepository.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/27.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

protocol ArticlesRepositoryProtocol {
    /// Note記事を取得する
    /// - Parameters:
    ///   - request: note記事のリクエスト
    ///   - completion: 完了時の処理
    func getArticles(request: URLRequest, completion: @escaping (Result<[Item], Error>) -> Void)
}
/// Note記事のRSSを取得するクラス
class ArticlesRepository: ArticlesRepositoryProtocol {
}

// MARK: - API Method
extension ArticlesRepository {
    func getArticles(request: URLRequest, completion: @escaping (Result<[Item], Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.unknown))
                return
            }
            // JSON型からArticles型にデコードする
            let decoder = JSONDecoder()
            guard let article = try?decoder.decode(Article.self, from: data) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(article.items))
        })
        task.resume()
    }
}

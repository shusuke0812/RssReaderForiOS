//
//  ArticlesRepository.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/27.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

/// ネットワークエラー
enum NetworkError: Error {
    case invalidURL         // 不正なURL
    case invalidResponse    // 不正なレスポンス
    case unknown            // 想定外エラー
    func description() -> String {
        switch self {
        case .invalidURL: return "DEBUG： 不正なURLです"
        case .invalidResponse: return "DEBUG： 不正なレスポンスです"
        case .unknown: return "DEBUG： レスポンスに失敗しました"
        }
    }
}
/// クライアントエラー
enum ClientError: Error {
    case parseFailed        // パース失敗
    case unknown            // 想定外エラー
}

// MARK: - Protocol
protocol ArticlesRepositoryProtocol {
    /// Note記事を取得する
    /// - Parameters:
    ///   - urlString: RSSのurl
    ///   - completion: 完了時の処理
    func getArticles(urlString: String, completion: @escaping (Result<Articles, Error>) -> Void)
}

// MARK: - Class
/// Note記事のRSSを取得するクラス
class ArticlesRepository: ArticlesRepositoryProtocol {
}

// MARK: - Method
extension ArticlesRepository {
    /// Note記事を取得する
    func getArticles(urlString: String, completion: @escaping (Result<Articles, Error>) -> Void) {
        // URL型に変換できないものは除く
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(NetworkError.unknown))
            return
        }
        
        // レスポンスを受け取る
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
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
            guard let articles = try?decoder.decode(Articles.self, from: data) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            completion(.success(articles))
        })
        task.resume()
    }
}

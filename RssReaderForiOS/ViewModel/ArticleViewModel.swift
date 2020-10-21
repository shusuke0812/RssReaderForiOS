//
//  ArticleViewModel.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/30.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

protocol ArticleViewModelDelegate: class {
    /// note記事の取得に成功した
    func didSuccessGetArticles()
    /// note記事の取得に失敗した
    /// - Parameter errorMessage: エラーメッセージ
    func didFailedGetArticles(errorMessage: String)
}

class ArticleViewModel: NSObject {
    /// note記事一覧のリポジトリクラス
    private let articleRepository: ArticlesRepositoryProtocol
    /// note記事一覧
    internal var articles: [Item]?
    /// デリゲート
    internal weak var delegate: ArticleViewModelDelegate?
    
    init(articleRepository: ArticlesRepositoryProtocol) {
        self.articleRepository = articleRepository
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
                    self?.articles = items
                    self?.delegate?.didSuccessGetArticles()
                }
            case .failure(let error):
                print("DEBUG： \(error)")
                self.delegate?.didFailedGetArticles(errorMessage: "note記事の取得に失敗しました")
            }
        })
    }
}
// MARK: - Table View Method
extension ArticleViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        if let articles = self.articles {
            cell.titleLabel.text = articles[indexPath.row].title
            cell.postDateLabel.text = articles[indexPath.row].pubDate
        }
        return cell
    }
}

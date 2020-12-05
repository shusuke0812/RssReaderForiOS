//
//  ViewController.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import PKHUD

class ArticleViewController: UIViewController {
    // BaseView
    private var baseView: ArticleBaseView { return self.view as! ArticleBaseView }
    // ViewModel
    private var viewModel: ArticleViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initRefreshControl()
        self.viewModel = ArticleViewModel(articleRepository: ArticlesRepository())
        self.setDelegateDataSource()
        self.loadArticles()
        self.setNavigationItem()
    }
    // MARK: - Action Method
    private func initRefreshControl() {
        let refresh: UIRefreshControl = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
        self.baseView.tableView.refreshControl = refresh
    }
    @objc private func refresh(sender: UIRefreshControl) {
        print("DEBUG： リフレッシュが呼ばれました")
        self.viewModel.loadArticles()
        self.baseView.tableView.refreshControl?.endRefreshing()
    }
}
extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        // 記事詳細ページへ移動
        self.transitionArticleDetailPage(article: self.viewModel.articles[indexPath.row])
    }
    private func transitionArticleDetailPage(article: Item) {
        let s = UIStoryboard(name: "ArticleDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! ArticleDetailViewController
        vc.article = article
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Initialized Method
extension ArticleViewController {
    // 通知元のdelegateに通知先である自身のクラスを登録
    private func setDelegateDataSource() {
        self.viewModel.delegate = self
        self.baseView.tableView.dataSource = self.viewModel
        self.baseView.tableView.delegate = self
        self.baseView.searchBar.delegate = self
    }
    private func setNavigationItem() {
        // ナビゲーションバーの設定
        self.title = "note記事一覧"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
// MARK: - API Method
extension ArticleViewController {
    /// note記事一覧を取得する
    private func loadArticles() {
        HUD.show(.progress)
        self.viewModel.loadArticles()
    }
}
// MARK: - Delegate Method
extension ArticleViewController: UISearchBarDelegate {
    // 検索バーの値を取得する
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText: String = searchBar.text else { return }
        // 検索バーが空文字の時は処理を抜ける
        if searchText.isEmpty {
            // キーボードを閉じる
            self.baseView.searchBar.endEditing(true)
            return
        }
        var newArticles: [Item] = []
        // 検索バーの文字列でtableViewをフィルタする
        self.viewModel.articles.forEach ({
            if $0.title.contains(searchText) {
                newArticles.insert($0, at: 0)
            }
        })
        self.viewModel.articles = newArticles
        // tableViewを更新
        self.baseView.tableView.reloadData()
        // キーボードを閉じる
        self.baseView.searchBar.endEditing(true)
    }
    // 検索バーの編集時の処理
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        // キャンセルボタンを設定
        self.baseView.searchBar.setShowsCancelButton(true, animated: true)
    }
    // 検索バーのキャンセルボタン押下時の処理
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.loadArticles()
        self.baseView.searchBar.setShowsCancelButton(false, animated: true)
    }
}
// MARK: - ViewModel Delegate Method
extension ArticleViewController: ArticleViewModelDelegate {
    func didSuccessGetArticles() {
        self.baseView.tableView.reloadData()
        HUD.hide()
    }
    func didFailedGetArticles(errorMessage: String) {
        print(errorMessage)
    }
}

//
//  ViewController.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import SwiftUI
import PKHUD

class ArticleViewController: UIViewController {
    /// BaseViewDataSource
    private var dataSource: ArticleBaseView.DataSource = .init()
    /// ViewModel
    private var viewModel: ArticleViewModel!
    /// note記事取得のリクエスト
    private var request: URLRequest { JsonArticleRequest(noteRss: Common.Api.noteRss).buildURLRequest() }
    
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initRefreshControl()
        self.viewModel = ArticleViewModel(articleRepository: ArticlesRepository())
        self.setDelegateDataSource()
        self.loadArticles()
        self.setNavigationItem()
        self.setView()
    }
    // MARK: - Action Method
    private func initRefreshControl() {
        let refresh: UIRefreshControl = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
        //self.baseView.tableView.refreshControl = refresh
    }
    @objc private func refresh(sender: UIRefreshControl) {
        print("DEBUG： リフレッシュが呼ばれました")
        self.viewModel.loadArticles(request: self.request)
        //self.baseView.tableView.refreshControl?.endRefreshing()
    }
}
// MARK: - Initialized Method
extension ArticleViewController {
    // 通知元のdelegateに通知先である自身のクラスを登録
    private func setDelegateDataSource() {
        self.viewModel.delegate = self
    }
    private func setNavigationItem() {
        // ナビゲーションバーの設定
        self.title = "note記事一覧"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setView() {
        let rootView = ArticleBaseView(delegate: self, dataSource: dataSource, keyword: "")
        let hostingVC = UIHostingController(rootView: rootView)
        self.addChild(hostingVC)
        hostingVC.view.frame = self.view.bounds
        self.view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
    }
}
// MARK: - Page Transition Method
extension ArticleViewController {
    private func transitionArticleDetailPage(article: Item) {
        let s = UIStoryboard(name: "ArticleDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! ArticleDetailViewController
        vc.article = article
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - API Method
extension ArticleViewController {
    /// note記事一覧を取得する
    private func loadArticles() {
        HUD.show(.progress)
        self.viewModel.loadArticles(request: request)
    }
}
// MARK: - ViewModel Delegate Method
extension ArticleViewController: ArticleViewModelDelegate {
    func didSuccessGetArticles() {
        DispatchQueue.main.async {
            self.dataSource.articles = self.viewModel.articles
            HUD.hide()
        }
    }
    func didFailedGetArticles(errorMessage: String) {
        print(errorMessage)
        HUD.hide()
    }
}
// MARK: - BaseView Delegate Method
extension ArticleViewController: ArticleBaseViewDelegate {
    func didTapCell() {
        self.transitionArticleDetailPage(article: self.viewModel.articles[dataSource.listIndex])
    }
}

//
//  ViewController.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // ViewModel
    private var viewModel: ArticleViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initRefreshControl()
        self.viewModel = ArticleViewModel(articleRepository: ArticlesRepository())
        self.setDelegate()
        self.getArticles()
    }
    // MARK: - Action Method
    private func initRefreshControl() {
        let refresh: UIRefreshControl = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
        self.tableView.refreshControl = refresh
    }
    @objc private func refresh(sender: UIRefreshControl) {
        print("DEBUG： リフレッシュが呼ばれました")
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
    }
}
// MARK: Initialized Method
extension ArticleViewController {
    // 通知元のdelegateに通知先である自身のクラスを登録
    private func setDelegate() {
        self.viewModel.delegate = self
    }
}

extension ArticleViewController: ArticleViewModelDelegate {
    /// note記事一覧を取得する
    private func getArticles() {
        self.viewModel.getArticles()
    }
    // note記事を表示する
    func didSuccessGetArticles() {
        print("test")
    }
    func didFailedGetArticles(errorMessage: String) {
        print(errorMessage)
    }
}

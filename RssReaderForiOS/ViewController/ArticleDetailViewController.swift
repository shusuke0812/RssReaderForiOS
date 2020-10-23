//
//  ArticleDetailViewController.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    // 遷移元から記事情報を受け取るプロパティ
    var article: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setWebView()
    }
}

extension ArticleDetailViewController {
    private func setUI() {
        // ナビゲーションバーの設定
        self.title = "note記事詳細"
    }
    private func setWebView() {
        let url = URL(string: self.article.link)
        let request = NSURLRequest(url: url!)
        self.webView.load(request as URLRequest)
    }
}

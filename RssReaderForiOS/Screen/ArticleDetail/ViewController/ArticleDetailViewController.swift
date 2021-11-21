//
//  ArticleDetailViewController.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit
import WebKit
import PKHUD

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    // ProgressView初期化
    private var progressView = UIProgressView(progressViewStyle: .bar)
    // 遷移元から記事情報を受け取るプロパティ
    var article: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.setWebView()
        self.setProgressView()
    }
}
// MARK: - Private Method
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
    private func setProgressView() {
        guard let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height else { return }
        self.progressView = UIProgressView(frame: CGRect(x: 0.0, y: navigationBarHeight, width: self.view.frame.size.width, height: 0.0))
        self.navigationController?.navigationBar.addSubview(progressView)
        self.webView.addObserver(self, forKeyPath: Common.ProgressViewStatus.isLoading, options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: Common.ProgressViewStatus.estimatedProgress, options: .new, context: nil)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else { return }
        switch keyPath {
            case Common.ProgressViewStatus.isLoading:
                if self.webView.isLoading {
                    self.progressView.alpha = 1.0
                    self.progressView.setProgress(0.1, animated: true)
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.progressView.alpha = 0.0
                    }, completion: { _ in
                        self.progressView.setProgress(0.0, animated: false)
                    })
                }
            case Common.ProgressViewStatus.estimatedProgress:
                self.progressView.setProgress(Float(self.webView.estimatedProgress), animated: true)
            default:
                break
        }
    }
}

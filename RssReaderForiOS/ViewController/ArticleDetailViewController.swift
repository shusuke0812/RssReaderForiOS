//
//  ArticleDetailViewController.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    // 遷移元から記事情報を受け取るプロパティ
    var article: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.article!)
    }
}

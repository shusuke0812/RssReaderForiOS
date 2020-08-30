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
    
    //private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initRefreshControl()
    }
    
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


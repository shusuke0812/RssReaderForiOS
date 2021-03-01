//
//  AppDelegate.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2020/8/4.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setRouting()
        
        return true
    }
}
extension AppDelegate {
    private func setRouting() {
        let s = UIStoryboard(name: "ArticleViewController", bundle: nil)
        let nc = s.instantiateInitialViewController() as! UINavigationController
        let articleVC = nc.topViewController as! ArticleViewController
        let router = ArticleRouter(view: articleVC)
        let presenter = ArticlePresenter(view: articleVC, router: router)
        articleVC.inject(presenter: presenter)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }
}

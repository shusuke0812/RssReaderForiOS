//
//  Transitioner.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/3/1.
//  Copyright © 2021 shusuke. All rights reserved.
//

/**
 * 画面遷移メソッドのプロトコル
 */

import UIKit

protocol Transitioner: UIViewController {
    /// ナビゲーション遷移
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    /// モーダル遷移
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> ())?)
    /// 画面を閉じる
    func dismiss(animated: Bool)
}
extension Transitioner {
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let nc = navigationController else { return }
        nc.pushViewController(viewController, animated: animated)
    }
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> ())?) {
        present(viewController, animated: animated, completion: completion)
    }
    func dissmiss(animated: Bool) {
        dismiss(animated: animated)
    }
}

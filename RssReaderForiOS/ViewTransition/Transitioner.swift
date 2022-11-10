//
//  Transitioner.swift
//  RssReaderForiOS
//
//  Created by Shusuke Ota on 2021/3/1.
//  Copyright © 2021 shusuke. All rights reserved.
//

/**
 * UIViewControllerが本来持っていた画面遷移メソッドのプロトコル
 */

import UIKit

protocol Transitioner: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> ())?)
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
    func dismiss(animated: Bool) {
        dismiss(animated: animated)
    }
}

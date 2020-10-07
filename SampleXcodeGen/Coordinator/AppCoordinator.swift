//
//  AppCoordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

//ログイン/ログアウトが発生したときにAppCoordinatorのstartを再度呼ぶための通知
extension NSNotification.Name {
  static let reStart = Notification.Name("reStart")
}

extension UserDefaults {
  private var loginedKey: String { "logined" }
  var isLogined: Bool {
    set { self.set(newValue, forKey: loginedKey) }
    get { self.bool(forKey: loginedKey) }
  }
}

final class AppCoordinator: Coordinator {
  private let window: UIWindow

  private var logoutedNavigator: UINavigationController?

  private var rootTabbarController: UITabBarController?
  private var rootNavigator: UINavigationController?

  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(window: UIWindow) {
    self.window = window

    NotificationCenter.default.addObserver(self, selector: #selector(reStartSelector), name: .reStart, object: nil)
  }

  func start() {
    if UserDefaults.standard.isLogined {
      print("ログイン")
      rootTabbarController = .init()
      let _rootNavigator = UINavigationController()
      window.rootViewController = rootTabbarController
      rootTabbarController!.setViewControllers([_rootNavigator], animated: false)
      let nextCoordinator = LoginedView1Coordinator.init(navigator: _rootNavigator)
      self.nextCoordinator = nextCoordinator
      nextCoordinator.start()
      //メモリーリーク対策
      rootNavigator?.popToRootViewController(animated: false)
      rootNavigator = _rootNavigator
    }
    else {
      print("ログアウト")
      let _logoutedNavigator = UINavigationController()
      window.rootViewController = _logoutedNavigator
      let nextCoordinator = LogoutView1Coordinator.init(navigator: _logoutedNavigator)
      self.nextCoordinator = nextCoordinator
      nextCoordinator.start()
      //メモリーリーク対策
      logoutedNavigator?.popToRootViewController(animated: false)
      logoutedNavigator = _logoutedNavigator
    }
    window.makeKeyAndVisible()
  }

  @objc func reStartSelector() {
    start()
  }
}

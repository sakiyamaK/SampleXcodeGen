//
//  View4Coordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/06/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class LoginedView4Coordinator: Coordinator {
  private let navigator: UINavigationController
  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  func start() {
    let vc = LoginedView4Controller()
    vc.tapLogoutButton = {
      UserDefaults.standard.isLogined = false
      NotificationCenter.default.post(name: .reStart, object: nil)
    }
    self.navigator.pushViewController(vc, animated: true)
  }
}

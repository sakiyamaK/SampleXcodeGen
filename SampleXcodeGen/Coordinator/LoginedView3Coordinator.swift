//
//  View3Coordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class LoginedView3Coordinator: Coordinator {
  private let navigator: UINavigationController
  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  func start() {
    DispatchQueue.main.async {[weak self] in
      let vc = LoginedView3Controller()
      vc.tapButton = {
//        print("tapButton")
      }
      self?.navigator.pushViewController(vc, animated: true)
    }
  }
}

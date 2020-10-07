//
//  View1Coordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class LoginedView1Coordinator: Coordinator {
  private let navigator: UINavigationController
  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  func start() {
    let vc = LoginedView1Controller()
    vc.tapButton = { [weak self] in
      guard let _self = self else { return }
      //        print("\(type(of: self)): tapButton")
      let nextCoordinator = LoginedView2Coordinator(navigator: _self.navigator)
      nextCoordinator.start()
      _self.nextCoordinator = nextCoordinator
    }
    self.navigator.pushViewController(vc, animated: true)
  }
}

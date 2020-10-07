//
//  View1Controller.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class LoginedView1Controller: UIViewController {

  @objc var tapButton:(()->Void)? = nil

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    print("\(type(of: self)): \(#function)")
    self.view.backgroundColor = .white
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

//  override func loadView() {
//    super.loadView()
//    print("\(type(of: self)): \(#function)")
//  }

  override func viewDidLoad() {
    super.viewDidLoad()
//    print("\(type(of: self)): \(#function)")

    navigationItem.title = String(describing: type(of: self))

    let btn = UIButton.init()
    btn.setTitle("次へ", for: .normal)
    btn.setTitleColor(.black, for: .normal)

    self.view.addSubview(btn)

    btn.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      btn.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
      btn.heightAnchor.constraint(equalToConstant: 100),
      NSLayoutConstraint(item: btn, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0),
      NSLayoutConstraint(item: btn, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0),
      //なぜかこれは警告が出る
//      btn.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1.0),
//      btn.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1.0)
    ])
    btn.addTarget(self, action: #selector(tapButtonSelector), for: .touchUpInside)
  }

  @objc func tapButtonSelector() {
    tapButton?()
  }
}

//
//  OnboardingViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
  // MARK: - Properties

  private var navToHomeButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
    button.configuration = .plain()
    button.configuration?.cornerStyle = .capsule
    button.configuration?.background.strokeColor = .label
    button.configuration?.background.strokeWidth = 1
    button.configuration?.title = "🤨 Start"
    button.configuration?.baseForegroundColor = .label
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  // MARK: - Methods

  func setup() {
    setupUI()
  }

  func setupUI() {
    view.backgroundColor = .systemBackground
    title = "Onboarding"

    // add button
    navToHomeButton.addTarget(self, action: #selector(navToHome), for: .touchUpInside)
    view.addSubview(navToHomeButton)
    
    // apply constraints
    applyConstraints()
  }
  
  private func applyConstraints() {
    let navToHomeButtonConstraints = [
      navToHomeButton.widthAnchor.constraint(equalToConstant: 100),
      navToHomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      navToHomeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ]
    
    NSLayoutConstraint.activate(navToHomeButtonConstraints)
  }

  @objc func navToHome() {
    UserDefaults.init().set(true, forKey:  UserDefaultsKey.isOnboarding.rawValue)
    
    navigationController?.setViewControllers([HomeViewController()], animated: true)
  }
}

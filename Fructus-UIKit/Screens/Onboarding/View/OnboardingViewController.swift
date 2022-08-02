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

  private var pageView: UICollectionView = {
    let collectionView: UICollectionView = .init()

    collectionView.isPagingEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false

    return collectionView
  }()

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    pageView.frame = view.bounds
  }

  // MARK: - Methods

  func setup() {
    setupUI()
  }

  func setupUI() {
    view.backgroundColor = .systemBackground
    title = "Onboarding"

    // add fruit card
    view.addSubview(pageView)

    // apply constraints
    applyConstraints()
  }

  private func applyConstraints() {
//    NSLayoutConstraint.activate()
  }

  @objc func navToHome() {
    UserDefaults().set(true, forKey: UserDefaultsKey.isOnboarding.rawValue)

    navigationController?.setViewControllers([HomeViewController()], animated: true)
  }
}

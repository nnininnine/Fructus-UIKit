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
    let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init())

    let layout: UICollectionViewFlowLayout = .init()
    layout.scrollDirection = .horizontal
    layout.itemSize = UIScreen.main.bounds.size

    collectionView.collectionViewLayout = layout
    collectionView.isPagingEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .red

    return collectionView
  }()

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  // MARK: - Methods

  func setup() {
    setupUI()
    setupPageView()
  }

  func setupUI() {
    view.backgroundColor = .systemBackground
    title = "Onboarding"
    navigationController?.navigationBar.isHidden = true

    // add fruit card
    view.addSubview(pageView)

    // apply constraints
    applyConstraints()
  }

  func setupPageView() {
    pageView.delegate = self
    pageView.dataSource = self
    pageView.register(FruitCardCell.self, forCellWithReuseIdentifier: FruitCardCell.identifier)
  }

  private func applyConstraints() {
    let pageViewConstraints = [
      pageView.widthAnchor.constraint(equalToConstant: view.bounds.width),
      pageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ]
    
    NSLayoutConstraint.activate(pageViewConstraints)
  }

  @objc func navToHome() {
    UserDefaults().set(true, forKey: UserDefaultsKey.isOnboarding.rawValue)

    navigationController?.setViewControllers([HomeViewController()], animated: true)
  }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCardCell.identifier, for: indexPath) as? FruitCardCell else { return UICollectionViewCell() }

    cell.configure(with: fruitsData[indexPath.row])

    return cell
  }
}

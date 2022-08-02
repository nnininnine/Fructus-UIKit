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

  private var dots: UIPageControl = {
    let pageControl: UIPageControl = .init(frame: .zero)
    pageControl.pageIndicatorTintColor = .systemGray5.withAlphaComponent(0.5)
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.translatesAutoresizingMaskIntoConstraints = false

    return pageControl
  }()

  private var pageView: UICollectionView = {
    let collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init())

    let layout: UICollectionViewFlowLayout = .init()
    layout.scrollDirection = .horizontal
    layout.itemSize = UIScreen.main.bounds.size

    collectionView.collectionViewLayout = layout
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  private let cellSpacing: CGFloat = 32

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

    // add fruit card collection view
    view.addSubview(pageView)

    // add page control
    view.addSubview(dots)

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

    let dotsConstraints = [
      dots.widthAnchor.constraint(equalToConstant: view.bounds.width),
      dots.heightAnchor.constraint(equalToConstant: 40),
      dots.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ]

    NSLayoutConstraint.activate(pageViewConstraints)
    NSLayoutConstraint.activate(dotsConstraints)
  }

  @objc func navToHome() {
    UserDefaults().set(true, forKey: UserDefaultsKey.isOnboarding.rawValue)

    navigationController?.setViewControllers([HomeViewController()], animated: false)
  }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // MARK: - Cell

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dots.numberOfPages = 5
    return 5
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCardCell.identifier, for: indexPath) as? FruitCardCell else { return UICollectionViewCell() }

    cell.configure(with: fruitsData[indexPath.row], onTap: navToHome)

    return cell
  }

  // MARK: - Scrolling

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageFloat = (scrollView.contentOffset.x / scrollView.bounds.width)
    let currentPage = Int(round(pageFloat))

    dots.currentPage = currentPage
  }

  // MARK: - Spacing, Sizing

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return .zero
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let side = cellSpacing / 2.0
    return .init(top: 0, left: side, bottom: 0, right: side)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return cellSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width - cellSpacing, height: collectionView.bounds.height)
  }
}

//
//  FruitDetailViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 3/8/2565 BE.
//

import UIKit

class FruitDetailViewController: UIViewController {
  // MARK: - Properties

  private var fruit: Fruit

  // MARK: - Subviews

  private lazy var header: FruitHeaderView = {
    let header = FruitHeaderView(frame: .zero, imageName: fruit.image, gradientColors: fruit.gradientColors)

    header.translatesAutoresizingMaskIntoConstraints = false

    return header
  }()

  private lazy var scrollView: UIScrollView = {
    let scrollView: UIScrollView = .init(frame: .zero)

    scrollView.contentInsetAdjustmentBehavior = .never
    scrollView.translatesAutoresizingMaskIntoConstraints = false

    return scrollView
  }()

  private let contentView: UIView = {
    let view: UIView = .init()

    view.translatesAutoresizingMaskIntoConstraints = false

    return view
  }()

  private lazy var titleLabel: UILabel = {
    let label: UILabel = .init()
    label.text = fruit.title
    label.sizeToFit()
    label.font = .systemFont(ofSize: 34, weight: .heavy)
    label.textColor = fruit.gradientColors[1] ?? .label
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label: UILabel = .init()
    label.text = fruit.description
    label.numberOfLines = 0
    label.sizeToFit()
    label.textColor = .label
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // MARK: - Init

  init(fruit: Fruit) {
    self.fruit = fruit

    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - LifeCycles

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  // MARK: - Methods

  func setup() {
    view.backgroundColor = .systemBackground

    setupNav()
    setupScrollView()
    setupViews()
  }

  func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)

    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }

  func setupNav() {
    title = fruit.title
    navigationItem.largeTitleDisplayMode = .never
  }

  func setupViews() {
    contentView.addSubview(header)
    contentView.addSubview(titleLabel)
    contentView.addSubview(descriptionLabel)

    applyConstraints()
  }

  func applyConstraints() {
    let headerConstraints = [
      header.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      header.topAnchor.constraint(equalTo: contentView.topAnchor),
      header.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      header.heightAnchor.constraint(equalToConstant: view.bounds.width * 1.18),
    ]

    let titleLabelConstraints = [
      titleLabel.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
      titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18),
      titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
    ]

    let descriptionLabelConstraints = [
      descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
      descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18),
      descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -18),
    ]

    NSLayoutConstraint.activate(headerConstraints)
    NSLayoutConstraint.activate(titleLabelConstraints)
    NSLayoutConstraint.activate(descriptionLabelConstraints)
  }
}

// MARK: - Previews

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct FruitDetailViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return FruitDetailViewController(fruit: fruitsData[0]).view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct FruitDetailViewController_Preview: PreviewProvider {
  static var previews: some View {
    FruitDetailViewRepresentable()
      .ignoresSafeArea()
  }
}
#endif

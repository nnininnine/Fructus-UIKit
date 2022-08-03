//
//  FruitHeaderView.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 3/8/2565 BE.
//

import UIKit

class FruitHeaderView: UIView {
  // MARK: - Properties

  var imageName: String
  var gradientColors: [UIColor?]

  // MARK: - Subviews

  private lazy var gradientView: UIView = {
    let view: UIView = .init(frame: .zero)

    return view
  }()

  private lazy var imageView: UIImageView = {
    let imageView: UIImageView = .init(image: UIImage(named: imageName))

    imageView.contentMode = .scaleAspectFit

    return imageView
  }()

  // MARK: - Init

  init(frame: CGRect, imageName: String, gradientColors: [UIColor?]) {
    self.imageName = imageName
    self.gradientColors = gradientColors

    super.init(frame: frame)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    gradientView.frame = bounds
    imageView.frame = bounds

    setup()
  }

  // MARK: - Methods

  func setup() {
    addSubview(gradientView)
    addSubview(imageView)

    // add gradient layout
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.colors = gradientColors.map { $0?.cgColor } as? [Any]

    gradientView.layer.addSublayer(gradient)
  }
}

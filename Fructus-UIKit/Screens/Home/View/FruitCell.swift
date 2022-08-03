//
//  FruitCell.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import UIKit

class FruitCell: UITableViewCell {
  // MARK: - Properties

  static let identifier = "FruitCell"

  private var fruit: Fruit? {
    didSet {
      addView()

      if let fruit = fruit {
        setupImage(with: fruit)
      }

      applyConstraints()
    }
  }

  // MARK: - Subviews

  private lazy var gradientView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 92, height: 92))

    // add gradient layer
    let gradient = CAGradientLayer()
    gradient.frame = CGRect(x: 0, y: 0, width: 92, height: 92)
    gradient.colors = fruit?.gradientColors.map { $0?.cgColor } as? [Any]
    gradient.cornerRadius = 8
    view.layer.insertSublayer(gradient, at: 0)
    view.translatesAutoresizingMaskIntoConstraints = false

    return view
  }()

  private lazy var fruitImage: UIImageView = {
    let imageView: UIImageView = .init(image: nil)

    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false

    return imageView
  }()

  // MARK: - Methods

  override func setSelected(_ selected: Bool, animated: Bool) {}

  func configure(with fruit: Fruit) {
    self.fruit = fruit
  }

  func addView() {
    contentView.addSubview(gradientView)
    contentView.addSubview(fruitImage)
  }

  func setupImage(with fruit: Fruit) {
    fruitImage.image = UIImage(named: fruit.image)
  }

  func applyConstraints() {
    let fruitImageConstraints = [
      fruitImage.widthAnchor.constraint(equalToConstant: 92),
      fruitImage.heightAnchor.constraint(equalToConstant: 92),
      fruitImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      fruitImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18)
    ]

    let gradientViewConstraints = [
      gradientView.topAnchor.constraint(equalTo: fruitImage.topAnchor),
      gradientView.leftAnchor.constraint(equalTo: fruitImage.leftAnchor)
    ]

    NSLayoutConstraint.activate(fruitImageConstraints)
    NSLayoutConstraint.activate(gradientViewConstraints)
  }
}

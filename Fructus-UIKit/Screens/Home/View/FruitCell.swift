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

  private var fruitImage: UIImageView = {
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
    contentView.addSubview(fruitImage)
  }

  func setupImage(with fruit: Fruit) {
    // add gradient layer
    let gradient = CAGradientLayer()
    gradient.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
    gradient.colors = fruit.gradientColors.map { $0?.cgColor } as? [Any]
    gradient.cornerRadius = 8

    fruitImage.image = UIImage(named: fruit.image)
    fruitImage.layer.insertSublayer(gradient, at: 0)
  }

  func applyConstraints() {
    let fruitImageConstraints = [
      fruitImage.widthAnchor.constraint(equalToConstant: 80),
      fruitImage.heightAnchor.constraint(equalToConstant: 80),
      fruitImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      fruitImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18)
    ]

    NSLayoutConstraint.activate(fruitImageConstraints)
  }
}

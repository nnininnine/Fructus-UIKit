//
//  FruitCardViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import UIKit

class FruitCardCell: UICollectionViewCell {
  // MARK: - Properties

  static let identifier = "FruitCardCell"
  
  private var fruit: Fruit?
  
  private var imageView: UIImageView = {
    let imageView: UIImageView = .init(frame: .zero)
    
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.backgroundColor = .red
    
    return imageView
  }()
  
  private var titleLabel: UILabel = {
    let label: UILabel = .init(frame: .zero)
    
    label.font = .systemFont(ofSize: 28, weight: .heavy)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()

  // MARK: - Methods
  
  func setupUI() {
    // add subviews
    addView()
    
    // add gradient
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = contentView.bounds
    gradientLayer.colors = fruit?.gradientColors.map { $0?.cgColor } as? [Any]
    gradientLayer.cornerRadius = 20
    
    contentView.layer.insertSublayer(gradientLayer, at: 0)
    
    setupImageView()
    
    applyConstraints()
  }
  
  func addView() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
  }
  
  func setupImageView() {
    if let image = fruit?.image {
      print(image)
      imageView.image = UIImage(named: image)
    }
  }
  
  func applyConstraints() {
    let imageViewConstraints = [
      imageView.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
      imageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width * 0.72),
      imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -100)
    ]
    
    NSLayoutConstraint.activate(imageViewConstraints)
  }
  
  func configure(with fruit: Fruit) {
    self.fruit = fruit
    
    setupUI()
  }
}

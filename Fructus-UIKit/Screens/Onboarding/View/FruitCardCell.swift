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
    
    // add shadow
    imageView.layer.shadowColor = UIColor.black.cgColor
    imageView.layer.shadowRadius = 8
    imageView.layer.shadowOpacity = 0.15
    imageView.layer.shadowOffset = CGSize(width: 6, height: 8)
    imageView.layer.masksToBounds = false
    
    return imageView
  }()
  
  private var titleLabel: UILabel = {
    let label: UILabel = .init(frame: .zero)
    
    label.font = .systemFont(ofSize: 32, weight: .heavy)
    label.textColor = .white
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    
    // add shadow
    label.layer.shadowColor = UIColor.black.cgColor
    label.layer.shadowRadius = 2
    label.layer.shadowOpacity = 0.15
    label.layer.shadowOffset = CGSize(width: 2, height: 2)
    label.layer.masksToBounds = false
    
    return label
  }()
  
  private var headlineLabel: UILabel = {
    let label = UILabel(frame: .zero)
    
    label.textColor = .white
    label.numberOfLines = .zero
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  private var startButton: UIButton = {
    let button: UIButton = .init(frame: CGRect(x: 0, y: 0, width: 104, height: 46))
    
    return button
  }()

  // MARK: - Methods
  
  func configure(with fruit: Fruit) {
    self.fruit = fruit
    
    setupUI()
  }
  
  func setupUI() {
    // add subviews
    addView()
    
    // add gradient
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = contentView.bounds
    gradientLayer.colors = fruit?.gradientColors.map { $0?.cgColor } as? [Any]
    gradientLayer.cornerRadius = 20
    
    contentView.layer.insertSublayer(gradientLayer, at: 0)
    
    // setup image
    setupImageView()
    
    // setup label
    titleLabel.text = fruit?.title
    headlineLabel.text = fruit?.headline
    
    applyConstraints()
  }
  
  func addView() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(headlineLabel)
  }
  
  func setupImageView() {
    if let image = fruit?.image {
      imageView.image = UIImage(named: image)
    }
  }
  
  func applyConstraints() {
    let imageViewConstraints = [
      imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      imageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width * 0.8),
      imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -110)
    ]
    
    let titleConstraints = [
      titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
      titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
    ]
    
    let headlineConstraints = [
      headlineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      headlineLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
      headlineLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
    ]
    
    NSLayoutConstraint.activate(imageViewConstraints)
    NSLayoutConstraint.activate(titleConstraints)
    NSLayoutConstraint.activate(headlineConstraints)
  }
}

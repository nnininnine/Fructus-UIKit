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

  // MARK: - Methods
  
  func setupUI() {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = contentView.bounds
    gradientLayer.colors = fruit?.gradientColors.map({ $0?.cgColor }) as? [Any]
    gradientLayer.cornerRadius = 20
    
    contentView.layer.insertSublayer(gradientLayer, at: 0)
  }
  
  func configure(with fruit: Fruit) {
    self.fruit = fruit
    
    setupUI()
  }
}

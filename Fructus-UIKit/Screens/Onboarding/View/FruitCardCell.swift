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

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods
  func setup() {
    setupUI()
  }
  
  func setupUI() {
    contentView.backgroundColor = fruit?.gradientColors[1]
  }
  
  func configure(with fruit: Fruit) {
    self.fruit = fruit
    
    setup()
  }
}

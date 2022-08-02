//
//  FruitCardViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import UIKit

class FruitCardViewController: UIViewController {
  // MARK: - Properties

  var fruit: Fruit

  // MARK: - Init

  init(fruit: Fruit) {
    self.fruit = fruit
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  // MARK: - Methods
  func setup() {
    setupUI()
  }
  
  func setupUI() {
    view.backgroundColor = fruit.gradientColors[0]
  }
}

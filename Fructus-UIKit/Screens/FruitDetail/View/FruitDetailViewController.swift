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

  // MARK: - Init
  
  init(fruit: Fruit) {
    self.fruit = fruit
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - LifeCycles

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  // MARK: - Methods

  func setup() {
    view.backgroundColor = .systemBackground
  }
}

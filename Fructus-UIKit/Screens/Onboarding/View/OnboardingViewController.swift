//
//  OnboardingViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
  // MARK: - Properties
  
  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }
  
  // MARK: - Methods
  
  func setup() {
    setupUI()
  }
  
  func setupUI() {
    view.backgroundColor = .white
    title = "Onboarding"
  }
}

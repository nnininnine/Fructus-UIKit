//
//  SettingsViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 3/8/2565 BE.
//

import UIKit

class SettingsViewController: UIViewController {
  // MARK: - Properties
  
  // MARK: - Subviews
  
  // MARK: - LifeCycles
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }
  
  // MARK: - Methods
  
  func setup() {
    view.backgroundColor = .systemBackground
    
    setupNav()
  }
  
  func setupNav() {
    title = "Settings"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    // add nav bar item
    let barButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(onTapClose))
    barButton.tintColor = .label
    navigationItem.rightBarButtonItem = barButton
  }
  
  @objc func onTapClose() {
    navigationController?.dismiss(animated: true)
  }
}

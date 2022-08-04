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
  
  private lazy var scrollView: UIScrollView = {
    let scrollView: UIScrollView = .init()
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.alwaysBounceVertical = true
    
    return scrollView
  }()
  
  // MARK: - LifeCycles
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }
  
  // MARK: - Methods
  
  func setup() {
    view.backgroundColor = .systemBackground
    
    setupNav()
    setupScrollView()
  }
  
  func setupNav() {
    title = "Settings"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    // add nav bar item
    let barButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(onTapClose))
    barButton.tintColor = .label
    navigationItem.rightBarButtonItem = barButton
  }
  
  func setupScrollView() {
    view.addSubview(scrollView)
    
    // setup scrollView constraints
    let scrollViewConstraints = [
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
      scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
    ]
    
    NSLayoutConstraint.activate(scrollViewConstraints)
  }
  
  @objc func onTapClose() {
    navigationController?.dismiss(animated: true)
  }
}

//
//  SettingsViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 3/8/2565 BE.
//

import UIKit

class SettingsViewController: UIViewController {
  // MARK: - Properties
  
  let infoText: String = "Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruit are sounrces of many essential nutrients, including potassium, dietary fiber, vitamins, and much more."
  
  let logoImage: UIImage? = .init(named: "logo")
  
  // MARK: - Subviews
  
  private lazy var scrollView: UIScrollView = {
    let scrollView: UIScrollView = .init()
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.alwaysBounceVertical = true
    
    return scrollView
  }()
  
  private lazy var contentView: UIView = {
    let view: UIView = .init()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .blue
    return view
  }()
  
  private lazy var fructusInfoView: UIStackView = {
    let stackView: UIStackView = .init(arrangedSubviews: [SettingsTitleView(frame: .zero, titleText: "Fructus", icon: "info.circle")])
    return stackView
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
    setupContentView()
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
    scrollView.addSubview(contentView)
    
    // setup scrollView constraints
    let scrollViewConstraints = [
      scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ]
    
    // setup contentView constraints
    let contentViewConstraints = [
      contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
    ]
    
    NSLayoutConstraint.activate(scrollViewConstraints)
    NSLayoutConstraint.activate(contentViewConstraints)
  }
  
  func setupContentView() {
    applyConstraints()
  }
  
  func applyConstraints() {}
  
  @objc func onTapClose() {
    navigationController?.dismiss(animated: true)
  }
}

// MARK: - Previews

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SettingsViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return SettingsViewController().view
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct SettingsViewController_Previews: PreviewProvider {
  static var previews: some View {
    SettingsViewRepresentable()
  }
}
#endif

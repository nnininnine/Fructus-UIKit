//
//  SettingsViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 3/8/2565 BE.
//

import UIKit

class SettingsViewController: UIViewController {
  // MARK: - Properties
  
  let infoText: String = "Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruit are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more."
  
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
    return view
  }()
  
  private lazy var divider: UIView = {
    let divider = UIView()
    divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    divider.backgroundColor = .systemGray4
    
    return divider
  }()
  
  private lazy var infoLabel: UILabel = {
    let label: UILabel = .init()
    label.text = infoText
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 14)
    label.sizeToFit()
    return label
  }()
  
  private lazy var infoImageView: UIImageView = {
    let imageView: UIImageView = .init(image: logoImage)
    
    imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 9
    imageView.clipsToBounds = true
    
    return imageView
  }()
  
  private lazy var infoContentView: UIStackView = {
    let stackView: UIStackView = .init(arrangedSubviews: [infoImageView, infoLabel])
    
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.spacing = 8
    stackView.sizeToFit()
    
    return stackView
  }()
  
  private lazy var fructusInfoView: UIStackView = {
    let stackView: UIStackView = .init(arrangedSubviews: [
      SettingsTitleView(frame: .zero, titleText: "Fructus", icon: "info.circle"),
      divider,
      infoContentView,
    ])
    
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layoutMargins = .init(top: 18, left: 18, bottom: 18, right: 18)
    stackView.alignment = .fill
    stackView.distribution = .equalSpacing
    stackView.spacing = 16
    stackView.sizeToFit()
    
    // style
    stackView.layer.cornerRadius = 6
    stackView.backgroundColor = .systemGray6
    
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
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -36),
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
    ]
    
    NSLayoutConstraint.activate(scrollViewConstraints)
    NSLayoutConstraint.activate(contentViewConstraints)
  }
  
  func setupContentView() {
    contentView.addSubview(fructusInfoView)
    
    applyConstraints()
  }
  
  func applyConstraints() {
    NSLayoutConstraint.activate([
      fructusInfoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
      fructusInfoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      fructusInfoView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      fructusInfoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
    ])
  }
  
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

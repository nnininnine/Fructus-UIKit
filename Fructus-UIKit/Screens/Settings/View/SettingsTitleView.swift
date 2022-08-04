//
//  SettingsTitleView.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 4/8/2565 BE.
//

import UIKit

class SettingsTitleView: UIView {
  // MARK: - Properties

  private var titleText: String
  private var icon: String

  // MARK: - Subviews

  private lazy var titleLabel: UILabel = {
    let label: UILabel = .init()
    label.text = titleText.uppercased()
    label.font = .boldSystemFont(ofSize: label.font.pointSize)
    label.sizeToFit()
    return label
  }()

  private lazy var iconView: UIImageView = {
    let imageView: UIImageView = .init(image: UIImage(systemName: icon))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var stackView: UIStackView = {
    let stackView: UIStackView = .init(arrangedSubviews: [titleLabel, iconView])
    stackView.axis = .horizontal
    stackView.distribution = .equalCentering
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  // MARK: - Init

  init(frame: CGRect, titleText: String, icon: String) {
    self.titleText = titleText
    self.icon = icon

    super.init(frame: frame)

    setup()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  func setup() {
    addSubview(stackView)
    applyConstraints()
  }

  func applyConstraints() {
    let stackViewConstraints = [
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leftAnchor.constraint(equalTo: leftAnchor),
      stackView.rightAnchor.constraint(equalTo: rightAnchor)
    ]

    NSLayoutConstraint.activate(stackViewConstraints)
  }
}

// MARK: - Previews

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SettingsTitleViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return SettingsTitleView(frame: .zero, titleText: "Fructus", icon: "info.circle")
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct SettingsTitleView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsTitleViewRepresentable()
      .previewLayout(.fixed(width: 340, height: 48))
  }
}
#endif

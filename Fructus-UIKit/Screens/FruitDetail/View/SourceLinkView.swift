//
//  SourceLinkView.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 4/8/2565 BE.
//

import UIKit

class SourceLinkView: UIView {
  // MARK: - Properties

  let titleText: String = "Content Source"

  // MARK: - Subviews

  private lazy var titleLabel: UILabel = {
    let label: UILabel = .init()
    label.text = titleText
    label.font = .systemFont(ofSize: 14)
    label.sizeToFit()
    return label
  }() 

  private lazy var stackView: UIStackView = {
    let stackView: UIStackView = .init(arrangedSubviews: [titleLabel])

    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.layoutMargins = .init(top: 14, left: 14, bottom: 14, right: 14)
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layer.cornerRadius = 6
    stackView.backgroundColor = .systemGray6

    return stackView
  }()

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
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

struct SourceLinkViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return SourceLinkView(frame: CGRect(x: 0, y: 0, width: 328, height: 48))
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct SourceLinkView_Previews: PreviewProvider {
  static var previews: some View {
    SourceLinkViewRepresentable()
      .padding(10)
      .previewLayout(.fixed(width: 348, height: 68))
  }
}

#endif

//
//  HomeViewController.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import UIKit

class HomeViewController: UIViewController {
  // MARK: - Properties

  private var tableView: UITableView = {
    let tableView: UITableView = .init(frame: .zero)

    return tableView
  }()

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    tableView.frame = view.bounds
  }

  // MARK: - Methods

  func setup() {
    setupUI()

    // setup table view
    setupTableView()
  }

  func setupUI() {
    view.backgroundColor = .white
    title = "Fruits"
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  func setupTableView() {
    view.addSubview(tableView)
  }
}

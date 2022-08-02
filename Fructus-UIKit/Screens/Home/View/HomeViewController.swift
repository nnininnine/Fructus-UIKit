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

    tableView.separatorStyle = .singleLine

    return tableView
  }()

  private var vm: HomeViewModel = .init(fruits: fruitsData)

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
    setupNav()

    // setup table view
    setupTableView()
  }

  func setupNav() {
    view.backgroundColor = .white
    title = "Fruits"
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
    
    // add nav bar item
    let barButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"), style: .plain, target: self, action: nil)
    barButton.tintColor = .label
    navigationItem.rightBarButtonItem = barButton
  }

  func setupTableView() {
    view.addSubview(tableView)
  }
}

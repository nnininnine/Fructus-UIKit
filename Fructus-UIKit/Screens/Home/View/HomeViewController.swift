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

    tableView.register(FruitCell.self, forCellReuseIdentifier: FruitCell.identifier)
    tableView.separatorStyle = .singleLine
    tableView.rowHeight = 112

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

    tableView.delegate = self
    tableView.dataSource = self
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vm.fruits.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: FruitCell.identifier, for: indexPath) as? FruitCell else { return UITableViewCell() }

    cell.configure(with: vm.fruits[indexPath.row])

    return cell
  }
}

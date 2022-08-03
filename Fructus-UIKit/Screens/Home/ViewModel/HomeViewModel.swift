//
//  HomeViewModel.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import UIKit

class HomeViewModel {
  // MARK: - Properties
  
  var fruits: Fruits
  
  // MARK: - Init
  
  init(fruits: Fruits) {
    self.fruits = fruits
  }
  
  // MARK: - Methods
  
  func showSetting(vc: UIViewController) {
    let settingVC = SettingsViewController()
    
    vc.present(settingVC, animated: true)
  }
}

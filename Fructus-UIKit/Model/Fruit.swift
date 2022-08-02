//
//  Fruit.swift
//  Fructus-UIKit
//
//  Created by 7Peaks on 2/8/2565 BE.
//

import UIKit

typealias Fruits = [Fruit]

struct Fruit: Identifiable {
  var id: UUID = .init()
  var title: String
  var headline: String
  var image: String
  var gradientColors: [UIColor?]
  var description: String
  var nutrition: [String]
}

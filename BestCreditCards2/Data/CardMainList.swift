//
//  CardMainList.swift
//  BestCreditCards2
//
//  Created by Wajid K Patan on 6/27/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import Foundation
import SwiftUI

struct CardSection: Codable, Identifiable {
  var id: Int
  var name: String
  var cards: [CardList]
}

struct CardList: Codable, Equatable, Identifiable {
  var id: Int
  var name: String
  var category: [String]
  var bonus: String
  var annualFee: String
  var introApr: String
  var benefits: [String]
  var imageURL: URL
}

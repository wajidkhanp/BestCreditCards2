//
//  LandingScreen.swift
//  BestCreditCards2
//
//  Created by Wajid K Patan on 6/27/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct LandingScreen: View {
  var body: some View {
    TabView {
      CardListView(filter: .bankCard)
        .tabItem {
          Image(systemName: "creditcard.fill")
          Text("Bank Cards")
      }
      CardListView(filter: .cardCategory)
        .tabItem {
          Image(systemName: "star.circle.fill")
          Text("Card Category")
      }
      CardListView(filter: .topCard)
        .tabItem {
          Image(systemName: "rosette")
          Text("Best Cards")
      }
      CardListView(filter: .rewardCalcaulator)
        .tabItem {
          Image(systemName: "bolt.fill")
          Text("Rewards Calculator")
      }
    }
  }
}

struct LandingScreen_Previews: PreviewProvider {
  static var previews: some View {
    LandingScreen()
  }
}

//
//  CardCompanyView.swift
//  BestCreditCards
//
//  Created by Wajid K Patan on 6/26/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct CardListView: View {
  
  enum FilterType {
    case none, bankCard, cardCategory, topCard, rewardCalcaulator
  }
  let filter: FilterType
  
  var carosel: [String] {
    switch filter {
    case .none:
      return Category.cardCompanyNames.sorted()
    case .bankCard:
      return Category.cardCompanyNames.sorted()
    case .cardCategory:
      return Category.cardCategory.sorted()
    case .topCard:
      return Category.topCardCategory.sorted()
    case .rewardCalcaulator:
      return Category.rewardCategory.sorted()
    }
  }
  
  var title: String{
    switch filter {
    case .none:
      return cardsMainList[0].name
    case .bankCard:
      return "Choose Issuing Bank"
    case .cardCategory:
      return "Choose Card Category"
    case .topCard:
      return "Top Picks"
    case .rewardCalcaulator:
      return "Reward Calcaulator"
    }
  }
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20){
          Text(title)
            .font(.largeTitle)
            .shadow(radius: 8)
          Group {
            ForEach(0..<carosel.count) { i in
              HStack {
                
                Image(self.carosel[i]).resizable().frame(width: 40, height: 40, alignment: .center).cornerRadius(4)
              NavigationLink(destination: CardListingView(cardCategoryName: self.carosel[i])) {
                Text("\(self.carosel[i])")
                  .foregroundColor(.white)
                  .font(.headline)
                  .frame(width: 250, height:40)
                  .background(Color.green)
                  .cornerRadius(4)
              }
              }
            }
            Spacer()
          }
        }
      } .navigationBarItems(trailing:
        NavigationLink(destination: CreditCardList()) {
          Text("All Cards")}
      )
    }
  }
}

struct CardCompanyView_Previews: PreviewProvider {
  static var previews: some View {
    CardListView(filter: .cardCategory)
  }
  
}

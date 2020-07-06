//
//  ContentView.swift
//  BestCard
//
//  Created by Wajid K Patan on 6/14/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct CardListingView: View {
  
  var passedCategoryName: String
  
  init(cardCategoryName: String) {
    passedCategoryName = cardCategoryName
  }
  var body: some View {
    List(createNewCardlist(allCardList: cardsMainList, passedCategoryName: passedCategoryName) ) { card in
      NavigationLink(destination: CardDetailView(cardData: card)) {
        CardListRow(cardlist: card)
        }
    }.navigationBarTitle("\(passedCategoryName)", displayMode: .inline)
      //.onAppear { UITableView.appearance().separatorStyle = .none }
  }
  
}

func createNewCardlist(allCardList: [CardSection], passedCategoryName: String) -> [CardList] {
  var cardCategory : String = ""
  
  if let index = Category.categories.values.firstIndex(of: passedCategoryName) {
    cardCategory = Category.categories.keys[index]
  }
  var newCardlist: [CardList] = []
  for cards in allCardList {
    for card in cards.cards {
      if(card.category.contains(cardCategory) ){
        newCardlist.append(card)
      }
    }
  }
  return newCardlist
}

struct CardListingView_Previews: PreviewProvider {
  static var previews: some View {
    CardListingView(cardCategoryName: "Rewards")
  }
}

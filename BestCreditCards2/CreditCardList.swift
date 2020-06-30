//
//  ContentView.swift
//  BestCreditCards2
//
//  Created by Wajid K Patan on 6/27/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct CreditCardList: View {
  let cardsMain = cardsMainList
    var body: some View {
     
        List {
          ForEach(cardsMain){ section in
            Section(header:
              HStack{
                Image(section.name).resizable().frame(width: 40, height: 40, alignment: .center).cornerRadius(4)
                Text(section.name)}) {
              ForEach(section.cards) { card in
                NavigationLink(destination: CardDetailView(cardData: card)) {
                  HStack {
                    AsyncImage(url: card.imageURL, placeholder: Text("Loading ...."))
                      .aspectRatio(contentMode: .fit).frame(width: 40, height: 30)
                    Text( card.name)
                  }
                }
              }
            }
          }
        }.navigationBarTitle("Credit Card List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardList()
    }
}

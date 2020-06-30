//
//  CardListtRow.swift
//  BestCard
//
//  Created by Wajid K Patan on 6/14/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct CardListRow: View {
  var cardlist: CardList
  var body: some View {
    VStack(alignment: .leading){
      
      Text(cardlist.name).font(.subheadline).bold()
      HStack(alignment: .center){
        AsyncImage(url: cardlist.imageURL, placeholder: Text("Loading ...."))
          .aspectRatio(contentMode: .fit).frame(width: 160, height: 95)
        VStack {
          Text("Welcome Bonus \n").font(.footnote).bold().underline()
          Text(cardlist.bonus+"\n").font(.caption).lineLimit(nil).lineSpacing(3)
          HStack {
          Text("Annual Fee: ").font(.footnote).bold().underline()
          Text(cardlist.annualFee).font(.caption).lineLimit(nil)
          }
        }
      }
      Spacer()
    }
  }
}

struct CardListtRow_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      CardListRow(cardlist: cardsMainList[0].cards[0])
      CardListRow(cardlist: cardsMainList[1].cards[1])
    }
  }
}

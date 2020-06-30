//
//  CardDetailView.swift
//  BestCard
//
//  Created by Wajid K Patan on 6/14/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI

struct CardDetailView: View {
  var cardData: CardList
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack{
        AsyncImage(url: cardData.imageURL, placeholder: Text("Loading ...."))
          .aspectRatio(contentMode: .fill).frame(width: 250, height: 185)
        
        Text(cardData.name+"\n").font(.headline).bold().foregroundColor(.blue).lineLimit(nil).frame(maxWidth: .infinity, alignment: .center)
        Text(cardData.annualFee+"\n").font(.headline).bold().foregroundColor(.gray)
        
        Text("Welcome Bonus\n").foregroundColor(.blue).bold()
        Text(cardData.bonus+"\n").font(.subheadline).lineLimit(nil).lineSpacing(3)
        
        Text("Featured Benefits").foregroundColor(.blue).bold()
        Group {
          VStack(alignment: .leading, spacing: 10){
            ForEach(0..<cardData.benefits.count){benefit in
              Text("\u{2022} "+"\(self.cardData.benefits[benefit])").font(.footnote)
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(3)
                .multilineTextAlignment(.leading)
            }
          }
          
        }
        
        if(!cardData.introApr.isEmpty){
          Text("\n Intro APR\n").foregroundColor(.blue).bold()
          Text(cardData.introApr).font(.subheadline).lineLimit(nil).lineSpacing(3)
        }
        Spacer()
      } .padding()
    }
  }
}

struct CardDetailView_Previews: PreviewProvider {
  
  static var previews: some View {
    CardDetailView(cardData: cardsMainList[0].cards[0])
  }
}

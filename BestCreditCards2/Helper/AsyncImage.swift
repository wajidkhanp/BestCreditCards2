//
//  AsyncImage.swift
//  BestCard
//
//  Created by Wajid K Patan on 6/14/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI
import Combine

struct AsyncImage<Placeholder: View>: View {
  @ObservedObject private var loader: ImageLoader
  private let placeholder: Placeholder
  
  @State private var half = false
  @State private var dim = false
  
  
  init(url: URL, placeholder: Placeholder? = nil) {
    loader = ImageLoader(url: url)
    self.placeholder = placeholder!
  }
  var body: some View {
    image
      .onAppear(perform: loader.load)
      .onDisappear(perform: loader.cancel)
  }
  private var image: some View {
    
    Group {
      if loader.image != nil {
        Image(uiImage: loader.image!)
          .resizable()
      } else {
        placeholder
      }
    }
    
  }
  
}



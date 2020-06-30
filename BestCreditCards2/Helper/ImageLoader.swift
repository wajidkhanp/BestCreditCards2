//
//  ImageLoader.swift
//  BestCard
//
//  Created by Wajid K Patan on 6/14/20.
//  Copyright © 2020 wajidInc. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
  @Published var image: UIImage?
  private let url: URL
  private var cancellable: AnyCancellable?
  
  deinit {
    cancellable?.cancel()
  }
  
  init(url: URL) {
    self.url = url
  }
  
  func load() {
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map {UIImage(data: $0.data)}
    .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .assign(to: \.image, on: self)
    
  }
  
  func cancel() {
    cancellable?.cancel()
  }
}


//
//  LTKDetailView.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import SwiftUI
import Kingfisher

struct LTKDetailView: View {
    @State var ID: String
    @StateObject var vm: LTKFeedVM = LTKFeedVM.shared()
    
    var body: some View {
        NavigationView {
            VStack {
                KFImage.url(vm.item(for: ID)?.imageURL)
                  .placeholder{vm.item(for: ID)?.color}
                  .loadDiskFileSynchronously() //slight loading performance hit to prevent flicker
                  .cacheMemoryOnly()
                  .fade(duration: 0.25)
                  .onProgress { receivedSize, totalSize in  }
                  .onSuccess { result in  }
                  .onFailure { error in }
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                
                KFImage.url(vm.item(for: ID)?.avatarURL)
                  .placeholder{vm.item(for: ID)?.color}
                  .loadDiskFileSynchronously() //slight loading performance hit to prevent flicker
                  .cacheMemoryOnly()
                  .fade(duration: 0.25)
                  .onProgress { receivedSize, totalSize in  }
                  .onSuccess { result in  }
                  .onFailure { error in }
                  .resizable()
                  .frame(width: 150, height: 150, alignment: .leading)
                  .aspectRatio(contentMode: .fill)
                
                
                if let productURLs = vm.item(for: ID)?.products {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(productURLs, id: \.self) { url in
                                KFImage.url(url)
                                  .loadDiskFileSynchronously() //slight loading performance hit to prevent flicker
                                  .cacheMemoryOnly()
                                  .fade(duration: 0.25)
                                  .onProgress { receivedSize, totalSize in  }
                                  .onSuccess { result in  }
                                  .onFailure { error in }
                                  .resizable()
                                  .frame(width: 100, height: 100, alignment: .leading)
                                  .aspectRatio(contentMode: .fill)
                            }
                        }
                    }.frame(height: 200)
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


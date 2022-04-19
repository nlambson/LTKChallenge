//
//  ContentView.swift
//  LTK
//
//  Created by Nathan Lambson on 4/17/22.
//

import SwiftUI
import Kingfisher

struct LTKFeedView: View {
    @StateObject var vm: LTKFeedVM = LTKFeedVM.shared()
    
    @State var activeTab: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { proxy in
                    TabView() {
                        ForEach(vm.items, id: \.self) { item in
                            let processor = DownsamplingImageProcessor(size: proxy.size)
                            
                            NavigationLink(destination: LTKDetailView(ID: item.ID)) {
                                KFImage.url(item.imageURL)
                                  .placeholder{item.color}
                                  .setProcessor(processor)
                                  .loadDiskFileSynchronously() //slight loading performance hit to prevent flicker
                                  .cacheMemoryOnly()
                                  .fade(duration: 0.25)
                                  .onProgress { receivedSize, totalSize in  }
                                  .onSuccess { result in  }
                                  .onFailure { error in }
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                             }
                        }
                        .rotationEffect(.degrees(-90)) // Rotate content
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                    }
                    .frame(
                        width: proxy.size.height, // Height & width swap
                        height: proxy.size.width
                    )
                    .rotationEffect(.degrees(90), anchor: .topLeading) // Rotate TabView
                    .offset(x: proxy.size.width) // Offset back into screens bounds
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }.navigationTitle("LikeToKnow Stream")
            .toolbar {
                ToolbarItem {
                    Button("Next", action: vm.fetchNextGroup)
                }
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

extension Binding {
 func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
    Binding(get: {
        wrappedValue
    }, set: { newValue in
        wrappedValue = newValue
        closure()
    })
 }
}

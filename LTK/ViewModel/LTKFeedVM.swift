//
//  LTKFeedVM.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import Foundation
import SwiftUI

struct LTKItem: Hashable {
    var ID: String
    var imageURL: URL
    let color: Color
    let avatarURL: URL
    let products: [URL]
    let hyperlink: String?
}

class LTKFeedVM: ObservableObject {
    @Published var items = [LTKItem]()
    @Published var count = 1

    private static var sharedLTKFeedVM: LTKFeedVM = {
        let shared = LTKFeedVM()

        // Configuration
        // ...

        return shared
    }()
    
    class func shared() -> LTKFeedVM {
        return sharedLTKFeedVM
    }
    
    func fetchNextGroup() {
        let networkData = LTKNetworkData.shared()
        networkData.fetchNextLTKs()
    }
    
    func item(for ID: String) -> LTKItem? {
        guard let item = items.first(where: {$0.ID == ID}) else {
            return nil
        }
        
        return item
    }
}

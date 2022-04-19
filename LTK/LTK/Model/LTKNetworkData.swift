//
//  LTKNetworkData.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

class LTKNetworkData {
    var networker = LTKAPI()
    var feedVM: LTKFeedVM = LTKFeedVM.shared()
    
    //total_results == item_max
    var meta: Meta = Meta(last_id: "", num_results: 10, total_results: 0, limit: 0, seed: "", next_url: "")
    
    var allProfiles: [Profile] = []
    var lastProfiles: [Profile] = []
    
    var allProducts: [Product] = []
    var lastProducts: [Product] = []

    var allLTKs: [LTK] = []
    var lastLTKs: [LTK] = []

    private static var sharedNetworker: LTKNetworkData = {
        let shared = LTKNetworkData()

        // Configuration
        // ...

        return shared
    }()
    
    class func shared() -> LTKNetworkData {
        return sharedNetworker
    }
    
    func fetchLTKs() {
        networker.fetchLTKS(0, meta: self.meta) { success, page, response in
            guard let response = response else {
                return
            }

            let _ = self.convertToModels(response: response)
            
            self.makePhotos()
        }
    }
    
    func makePhotos() {
        let combo = zip(lastLTKs, lastProfiles)
        
        for (ltk, profile) in combo {
            guard let heroImageUrl = URL(string: ltk.hero_image) else { continue }
            
            guard let avatarString = profile.avatar_url, let avatarUrl = URL(string: avatarString) else { continue }
            
            let product = lastProducts.filter{$0.ltk_id == ltk.id}.first
            let products = lastProducts.filter{$0.ltk_id == ltk.id}
            let productURLs = products.compactMap { product in
                return URL(string: product.image_url)
            }
            
            let item = LTKItem(ID: ltk.id, imageURL: heroImageUrl, color: Color.random, avatarURL: avatarUrl, products: productURLs, hyperlink: product?.hyperlink)
            
            self.feedVM.items.append(item)
        }
    }
    
    func fetchNextLTKs() {
        if allLTKs.count <= meta.total_results {
            let page = allLTKs.count / meta.num_results
            print("PAGE: \(page)")
            
            networker.fetchLTKS(page, meta: self.meta) { success, page, response in
                guard let response = response else {
                    return
                }
                
                let _ = self.convertToModels(response: response)
                
                self.makePhotos()
            }
        }
    }
    
    func convertToModels(response: AFDataResponse<Any>) -> Bool {
        switch response.result {
        case .success(let value):
            let json = JSON(value)

            let ltksJSON = json["ltks"]
            if let data = try? ltksJSON.rawData() {
                let decoder = JSONDecoder()
                do {
                    lastLTKs = try decoder.decode([LTK].self, from: data)
                    allLTKs.append(contentsOf: lastLTKs)
                    print(lastLTKs)
                } catch(let error) {
                     print("get ltks Unexpected error: \(error).")
                    return false
                }
            }

            let productsJSON = json["products"]
            if let data = try? productsJSON.rawData() {
                let decoder = JSONDecoder()
                do {
                    lastProducts = try decoder.decode([Product].self, from: data)
                    allProducts.append(contentsOf: lastProducts)
                    print(lastProducts)
                } catch(let error) {
                     print("get products Unexpected error: \(error).")
                    return false
                }
            }
            
            let profilesJSON = json["profiles"]
            if let data = try? profilesJSON.rawData() {
                let decoder = JSONDecoder()
                do {
                    lastProfiles = try decoder.decode([Profile].self, from: data)
                    allProfiles.append(contentsOf: lastProfiles)
                    print(lastProfiles)
                } catch(let error) {
                     print("get profiles Unexpected error: \(error).")
                    return false
                }
            }
            
            let metasJSON = json["meta"]
            if let data = try? metasJSON.rawData() {
                let decoder = JSONDecoder()
                do {
                    meta = try decoder.decode(Meta.self, from: data)
                    print(meta)
                } catch(let error) {
                     print("get meta Unexpected error: \(error).")
                    return false
                }
            }
        case .failure(let error):
            print(error)
            return false
        }
        
        return true
    }
}

extension Int {
    func times(_ f: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
    
    func times(_ f: @autoclosure () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                f()
            }
        }
    }
}

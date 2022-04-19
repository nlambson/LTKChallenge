//
//  LTKAPI.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//
// https://weekly.elfitz.com/2019/12/19/swiftly-deal-with-pagination-in-swift/
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

class LTKAPI {
    
    func fetchLTKS(_ page: Int, meta: Meta,  complete: @escaping (Bool, Int, AFDataResponse<Any>?) -> Void) {
        let urlString = "https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/"
        
        if page == 0 {
            let parameters = ["featured": "true",
                              "limit": "10"]
            
            AF.request(urlString, method: .get, parameters: parameters).validate().responseJSON { response in

                if case .success(_) = response.result {
                    complete(true, page, response)
                }
            }
        } else if meta.last_id.count > 0 && page != 0 {
            let parameters = ["featured": "true",
                              "limit": "10",
                              "last_id": "\(meta.last_id)",
                              "seed": "\(meta.seed)"
            ]
            
            AF.request(urlString, method: .get, parameters: parameters).validate().responseJSON { response in

                if case .success(_) = response.result {
                    complete(true, page, response)
                }
            }
        }
    }
}

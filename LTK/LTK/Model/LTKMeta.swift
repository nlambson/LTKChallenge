//
//  LTKMeta.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import Foundation

//META
//{
//   "last_id":"b4926edb-be54-11ec-ae99-0242ac110004",
//   "num_results":20,
//   "total_results":465,
//   "limit":20,
//   "seed":"0000000000000000000000000000000e",
//   "next_url":"https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true\u0026last_id=b4926edb-be54-11ec-ae99-0242ac110004\u0026limit=20\u0026seed=0000000000000000000000000000000e"
//},

struct Meta: Codable {
    var last_id: String
    var num_results: Int
    var total_results: Int
    var limit: Int
    var seed: String
    var next_url: String
}

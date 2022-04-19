//
//  LTK.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import Foundation

//LTK
//{
//     "hero_image":"https://images.liketoknow.it/c70ee072-b8f8-11ec-a164-0242ac110004",
//     "hero_image_width":2048,
//     "hero_image_height":2048,
//     "id":"c70ee072-b8f8-11ec-a164-0242ac110004",
//     "profile_id":"5b41988b-849e-11ec-8513-cc302b8cc1a3",
//     "profile_user_id":"5b6e330d-849e-11ec-8184-5f013ef8e3df",
//     "video_media_id":null,
//     "status":"PUBLISHED",
//     "caption":"BATHROOM + HOME UPGRADE:\nBlack door levers, gold sink faucet, single hole faucet, modern faucet, modern interior door handles, polished nickel vanity light, 3 light vanity light\n\n#LTKhome #LTKunder100",
//     "share_url":"https://liketk.it/3CoeL",
//     "date_created":"2022-04-10T18:05:17+00:00",
//     "date_updated":"2022-04-10T18:05:20+00:00",
//     "date_scheduled":null,
//     "date_published":"2022-04-10T18:05:20+00:00",
//     "product_ids":[
//        "c9265188-b8f8-11ec-a6b9-0242ac110004",
//        "c92c12c5-b8f8-11ec-a6b9-0242ac110004",
//        "c935007d-b8f8-11ec-a6b9-0242ac110004"
//     ],
//     "hash":"63CgQF3cAqBicCmCoF2DPe"
//  },

struct LTK: Codable {
    public var hero_image: String
    public var hero_image_width: Int
    public var hero_image_height: Int
    public var id: String
    public var profile_id: String?
    public var profile_user_id: String?
    public var video_media_id: String?
    public var status: String?
    public var caption: String?
    public var share_url: String?
    public var date_created: String?
    public var date_updated: String?
    public var date_scheduled: String?
    public var date_published: String?
    public var product_ids: [String]
    public var hash: String
}

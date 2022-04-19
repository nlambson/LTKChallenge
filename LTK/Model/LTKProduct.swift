//
//  LTKProduct.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import Foundation

//PRODUCTS
//{
//     "id":"c9265188-b8f8-11ec-a6b9-0242ac110004",
//     "ltk_id":"c70ee072-b8f8-11ec-a164-0242ac110004",
//     "hyperlink":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//     "image_url":"https://images.rewardstyle.com/img?v=1\u0026width=256\u0026height=256\u0026crop\u0026p=206745681",
//     "links":{
//        "ANDROID_CONSUMER_APP":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1945\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "ANDROID_CONSUMER_APP_SS":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1946\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "IOS_CONSUMER_APP":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1907\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "IOS_CONSUMER_APP_SS":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1908\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "LTK_EMAIL":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1141\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "LTK_WEB":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1144\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "LTK_WIDGET":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?__cid=1843\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR",
//        "TAILORED_EMAIL":"https://rstyle.me/+-xlqwqWNh0wKGacjuX8chQ?1141=c70ee072-b8f8-11ec-a164-0242ac110004\u0026__cid=1875\u0026li=c70ee072-b8f8-11ec-a164-0242ac110004\u0026lpm=SIMILAR"
//     },
//     "matching":"SIMILAR",
//     "product_details_id":"206745681:2"
//  },

struct Product: Codable {
    var id: String
    var ltk_id: String
    var hyperlink: String
    var image_url: String
    var ANDROID_CONSUMER_APP: String?
    var ANDROID_CONSUMER_APP_SS: String?
    var IOS_CONSUMER_APP: String?
    var IOS_CONSUMER_APP_SS: String?
    var LTK_EMAIL: String?
    var LTK_WEB: String?
    var LTK_WIDGET: String?
    var TAILORED_EMAIL: String?
}


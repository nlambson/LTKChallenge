//
//  LTKProfile.swift
//  LTK
//
//  Created by Nathan Lambson on 4/18/22.
//

import Foundation

//PROFILES
//{
//     "id":"410235e4-9bc9-11ec-8f60-f21ee72f220c",
//     "avatar_url":"https://avatar-cdn.liketoknow.it/410235e4-9bc9-11ec-8f60-f21ee72f220c.0d0102b2-2f2c-4ada-b67d-305307b43830",
//     "avatar_upload_url":null,
//     "display_name":"A_Journey_of_a_Lifetime",
//     "full_name":"Jackie Ajjouri",
//     "instagram_name":"",
//     "blog_name":"",
//     "blog_url":"",
//     "bg_image_url":"https://avatar-cdn.liketoknow.it/410235e4-9bc9-11ec-8f60-f21ee72f220c.7fba48ad-c7c1-4778-98c5-bd94a706912b",
//     "bg_upload_url":null,
//     "bio":"",
//     "rs_account_id":445470,
//     "searchable":true
//  },

struct Profile: Codable {
    var id: String
    var avatar_url: String?
    var avatar_upload_url: String?
    var display_name: String?
    var full_name: String?
    var instagram_name: String?
    var blog_name: String?
    var blog_url: String?
    var bg_image_url: String?
    var bg_upload_url: String?
    var bio: String?
    var rs_account_id: Int
    var searchable: Bool
}


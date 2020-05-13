//
//  PostData.swift
//  Instagram
//
//  Created by IKEGAMIKeitoku on 01.05.20.
//  Copyright © 2020 keitoku.ikegami. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    
    var id: String
    var name: String?
    var caption: String?
    var comment: [String] = []
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String

        self.caption = postDic["caption"] as? String

        if let comment = postDic["comment"] as? [String] {
            self.comment = comment
        }
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {

            if self.likes.firstIndex(of: myid) != nil {

                self.isLiked = true
            }
        }
    }
}

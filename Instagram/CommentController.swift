//
//  CommentController.swift
//  Instagram
//
//  Created by IKEGAMIKeitoku on 01.05.20.
//  Copyright © 2020 keitoku.ikegami. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentController: UIViewController {
    
    @IBOutlet weak var comments: UITextField!

    var hello: PostData!

    @IBAction func postCommentButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        let postDic = ["comment": self.comments.text!] as [String : Any]
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(hello.id)
        
        postRef.updateData(postDic)

        SVProgressHUD.showSuccess(withStatus: "投稿しました")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

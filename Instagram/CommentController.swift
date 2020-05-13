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
        
        let name = Auth.auth().currentUser?.displayName
        
        if (Auth.auth().currentUser?.uid) != nil {
            
            var updateValue: FieldValue!

            let say: String = name! + " : " + self.comments.text!
        
            updateValue = FieldValue.arrayUnion([say])
        
            let postRef = Firestore.firestore().collection(Const.PostPath).document(hello.id)
            postRef.updateData(["comment": updateValue!])
        }

        SVProgressHUD.showSuccess(withStatus: "投稿しました")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

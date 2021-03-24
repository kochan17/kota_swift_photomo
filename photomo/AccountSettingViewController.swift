//
//  AccountSettingViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/02/28.
//

import UIKit
import NCMB

class AccountSettingViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userComment: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = NCMBUser.currentUser {
            userName.text = user["username"]
            userComment.text = user["usercomment"]
        }
        
        
        
    }
    
    @IBAction func profileImage(_ sender: Any) {
        if let user = NCMBUser.currentUser {
            user["username"] = userName.text
            user["usercomment"] = userComment.text
            user.save()
        }
            
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

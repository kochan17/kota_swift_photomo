//
//  ProfileViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/01/25.
//

import UIKit
import NCMB

class ProfileViewController: UIViewController {

    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var address: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func profileupdate(_ sender: Any) {
        let tmpnickname = nickname.text
        let tmpage = age.text
        let tmpaddress = address.text
        
        let user = NCMBUser.currentUser
        user!["nickname"] = tmpnickname
        user!["age"] = tmpage
        user!["address"] = tmpaddress
        user!.save()
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

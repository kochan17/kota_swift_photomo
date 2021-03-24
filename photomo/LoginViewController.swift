//
//  LoginViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/02/07.
//

import UIKit
import NCMB
class LoginViewController: UIViewController {

    @IBOutlet weak var btnUse: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnUse.layer.borderColor = UIColor.white.cgColor
        btnLoginUse.layer.borderColor = UIColor.white.cgColor

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var btnLoginUse: UIButton!
    //performSegueは画面遷移を行う
    @IBAction func createNewAccount(_ sender: Any) {
        performSegue(withIdentifier: "tocreatenewacount", sender: nil)
    }
    
    @IBAction func use(_ sender: Any) {
        performSegue(withIdentifier: "toUse", sender: nil)
    }
    
    @IBAction func loginUse(_ sender: Any) {
        performSegue(withIdentifier: "touselogin", sender: nil)
    }
    @IBAction func notLogin(_ sender: Any) {
    }


}

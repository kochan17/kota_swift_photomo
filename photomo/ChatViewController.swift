//
//  ChatViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/03/07.
//

import UIKit
import SkyWay

class ChatViewController: UIViewController {
    var peer: SKWPeer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setup() {
//        apikeyを定義する→apikeyの＝より右をセットする→
//        UIApplication.shared.delegate（Appdelegateを呼び出す）
        guard let apikey = (UIApplication.shared.delegate as? AppDelegate)?.skywayAPIKey, let domain = (UIApplication.shared.delegate as? AppDelegate)?.skywayDomain else{
                    print("Not set apikey or domain")
                    return
                }
        let option: SKWPeerOption = SKWPeerOption.init();
                option.key = apikey
                option.domain = domain
        
        peer = SKWPeer(options: option)
        
        if let _peer = peer{
//                    self.setupPeerCallBacks(peer: _peer)
                }else{
                    print("failed to create peer setup")
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

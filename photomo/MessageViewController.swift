//
//  MessageViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/01/18.
//

import UIKit
import NCMB

class MessageViewController: UIViewController {

    @IBOutlet weak var txtmessege: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnChat(_ sender: Any) {
        performSegue(withIdentifier: "chat", sender: nil)
    }
    @IBAction func btnSend(_ sender: Any) {
        let txtmessege = self.txtmessege.text
        // testクラスのNCMBObjectを作成
        let object : NCMBObject = NCMBObject(className: "lesson")

        // オブジェクトに値を設定
        object["fieldA"] = "Hello, NCMB!"
        object["fieldB"] = txtmessege
        object["name"] = 42
        object["fieldD"] = ["abcd", "efgh", "ijkl"]
        var geoPoint : NCMBGeoPoint? = NCMBGeoPoint.init()
        geoPoint?.latitude = Double(35.690921)
        geoPoint?.longitude = Double(139.700258)
        object["location"] = geoPoint

        // データストアへの登録を実施
        object.saveInBackground(callback: { result in
            switch result {
                case .success:
                    // 保存に成功した場合の処理
                    print("保存に成功しました")
                case let .failure(error):
                    // 保存に失敗した場合の処理
                    print("保存に失敗しました: \(error)")
            }
        })
        
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

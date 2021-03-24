//
//  ModelViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/01/18.
//

import UIKit
import NCMB

class ModelViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    var willModels : [WillModel] = [WillModel]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return willModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotographerCollectionViewCell
        let willModel = willModels[indexPath.row]
        cell.location.text = willModel.location
        cell.userImage.text = willModel.username
        if let myimage = willModel.myimage {
            //        写真取ってくる
            let file : NCMBFile = NCMBFile(fileName: myimage)
            file.fetchInBackground { (result) in
                switch result {
                case .success(let data):
                    print("test")
                    if let data = data{
                        let testimage = UIImage(data: data)
                        DispatchQueue.main.async {
                                                        // メインスレッドで実行 UIの処理など
                            cell.imageView.image = testimage
                                                    }
                        
                    }
                case .failure(let error):
                    print("error")
                }
            }
            

        }

        
        //セルの背景色をblueに
        cell.backgroundColor = .blue
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width / 3 - 10
//        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: availableWidth, height: availableWidth * 1.5)
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getWillModelDate()
//        mbaaSに自分が登録されてるか確認
//        登録されてたらbuttonのlabelを「解除」
//        登録されてなければ「登録」
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func willModel(_ sender: Any) {
        let object : NCMBObject = NCMBObject(className: "willModel")
        object["username"] = "Hello, NCMB!"
        object["usercomment"] = "Hello, NCMB!"
        object["deleteflag"] = false
        if let user = NCMBUser.currentUser {
            object["userID"] = user.objectId
        }
        object.save()
    }
    
//    MBaasから写真などのデータを持ってくる
    func getWillModelDate() {
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "willModel")
//       query.find()でwillModelの中身をresultに入れる
        var result = query.find()
        switch result {
        case .success(let datas):
//            datasの中の写真を一件一件処理する(一件の処理をループする)
            for data in datas{
//                ? データがないときnil そのnilも入れる事ができる
                let location : String? = data["location"]
                let username : String? = data["username"]
                let myimage : String? = data["myimage"]
                let willModel = WillModel(location: location, username: username, myimage: myimage)
                willModels.append(willModel)
            }
//            collectionViewを更新する
            collectionView.reloadData()
        case .failure(let error):
            print(error)
        }
        
    }
    
}
//構造体
struct WillModel {
    let location : String?
    let username : String?
    let myimage : String?
}

//
//  PhotographerViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/01/18.
//

import UIKit
import NCMB

class PhotographerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var willPhotographers : [WillModel] = [WillModel]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return willPhotographers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as!
            ModelCollectionViewCell
        let willPhotographer = willPhotographers[indexPath.row]
        cell.userLocation.text = willPhotographer.location
//        cell.userImage.image = willPhotographer.username
        //セルの背景色をblueに
        cell.backgroundColor = .red
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width / 3 - 10
//        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: availableWidth, height: availableWidth * 1.5)
    }
    
    @IBOutlet weak var collectionView2: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

//      mbaaSに自分が登録されてるか確認
//        登録されてたらbuttonのlabelを解除
//        登録されてなければ「登録」
    }
    
    @IBAction func willPhotographer(_ sender: Any) {
        let object : NCMBObject = NCMBObject(className: "willPhotographer")
        object["userName"] = "Hello, NCMB!"
        object["usercomment"] = "Hello, NCMB!"
        object["deleteflag"] = false
        if let user = NCMBUser.currentUser {
            object["userID"] = user.objectId
        }
        object.save()
    }
    
    func getWillPhotographerData() {
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "willPhotographer")
   
    
        var result = query.find()
        switch result {
        case .success(let datas):
            
            for data in datas{
                
                
                let location : String? = data["location"]
                let username : String? = data["username"]
                let myimage : String? = data["myimage"]
                let willPhotographer = WillModel(location: location, username: username, myimage: myimage)
                willPhotographers.append(willPhotographer)
            }
            collectionView2.reloadData()
        case .failure(let error):
            print(error)
        }
    }
}





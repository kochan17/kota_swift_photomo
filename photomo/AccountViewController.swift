//
//  AccountViewController.swift
//  photomo
//
//  Created by 石田幸太 on 2021/03/21.
//

import UIKit

class AccountViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var image: UIImageView!
    
    @IBAction func set(_ sender: Any) {
//        addCameraView()
        addImagePickerView()
        
    }
    @IBAction func ok(_ sender: Any) {
    }
    // ライブラリーの利用
       func addImagePickerView() {
           //imagePickerViewを表示する
           let pickerController = UIImagePickerController()
           pickerController.sourceType = .photoLibrary
           pickerController.delegate = self
           self.present(pickerController, animated: true, completion: nil)
       }
    func addCameraView() {

            // シミュレーターでやるとカメラが使えないから、クラッシュしないようにアラート表示させる方へ分岐
            if !UIImagePickerController.isSourceTypeAvailable(.camera){

                let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)

                let okAction = UIAlertAction.init(title: "Alright", style: .default, handler: {(alert: UIAlertAction!) in
                })

                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)

            }
            else{
                //imagePickerViewを表示する
                let pickerController = UIImagePickerController()
                pickerController.sourceType = .camera
                pickerController.delegate = self
                self.present(pickerController, animated: true, completion: nil)
            }
        }
    // 以下の二つは、sourceTypeがcameraでもphotoLibraryでも共通
        // pickerの選択がキャンセルされた時の処理
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
             dismiss(animated: true, completion: nil)
        }
        // 画像が選択(撮影)された時の処理
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("The image was selected")
            print(info[UIImagePickerController.InfoKey.originalImage] as! UIImage)

            guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage? else {return}

            // imageを格納
            image.image = selectedImage

            self.dismiss(animated: true, completion: nil)
        }
}

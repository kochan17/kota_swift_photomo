//
//  AppDelegate.swift
//  photomo
//
//  Created by 石田幸太 on 2021/01/18.
//

import UIKit
import NCMB
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var skywayAPIKey:String?
    var skywayDomain:String?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NCMB.initialize(applicationKey: "6924af26b3645104a7ef5a7836924bf9933bc14d6815b4739bcdf00ad82b702d", clientKey: "fd4f755299138a1a49f58bfb1dda8a091f6d6b88fa9c5cfb086480270238b330")
        // 匿名ユーザの自動生成を有効化
        NCMBUser.enableAutomaticUser()
        skywayAPIKey = "d9609304-14d3-473c-93a8-6a4b1d758c19"
        skywayDomain = "localhost"
        if let userlogin = UserDefaults.standard.string(forKey: "username"),
           let passwordlogin = UserDefaults.standard.string(forKey: "password")
        {
            let result = NCMBUser.logIn(userName: userlogin, password: passwordlogin)
            switch result {
            case .success:
                print("匿名ユーザーでのログインに成功しました")
            case let .failure(error):
                print("匿名ユーザーでのログインに失敗しました: \(error)")
            }
        } else {
            let username = NSUUID().uuidString
            let password = String(Date().timeIntervalSince1970)
            let user = NCMBUser()
            user.userName = username
            user.password = password
            let result = user.signUp()
            switch result {
            case .success:
                print("匿名ユーザーでのログインに成功しました")
                UserDefaults.standard.set(username, forKey: "username")
                UserDefaults.standard.set(password, forKey: "password")
            case let .failure(error):
                print("匿名ユーザーでのログインに失敗しました: \(error)")
            }
        }
      
        // 匿名ユーザーでのログイン
//        let result = NCMBUser.automaticCurrentUserInBackground(callback: { result in
//            switch result {
//                case .success:
//                    // ログインに成功した場合の処理
//                        print("匿名ユーザーでのログインに成功しました")
//
//                case let .failure(error):
//                    // ログインに失敗した場合の処理
//                    print("匿名ユーザーでのログインに失敗しました: \(error)")
//            }
//        })
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


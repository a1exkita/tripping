//
//  AppDelegate.swift
//  tabi
//
//  Created by ATSUHITO KITA on 3/4/20.
//  Copyright © 2020 ATSUHITO KITA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import CodableFirebase

var testData:[Post] = []

extension DocumentReference: DocumentReferenceType {}
extension GeoPoint: GeoPointType {}
extension FieldValue: FieldValueType {}
extension Timestamp: TimestampType {}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        applicationDidLoad()
        return true
    }
    
    func applicationDidLoad() {
        Firestore.firestore().collection("posts").getDocuments { (snapshot, error) in
    
            print(snapshot)
            for doc in snapshot!.documents {
                let post = try! FirebaseDecoder().decode(Post.self, from: doc.data());
                testData.append(post);
            }
        }
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

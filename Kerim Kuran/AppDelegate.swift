//
//  AppDelegate.swift
//  Kerim Kuran
//
//  Created by Kamil Caglar on 30/01/2023.
//

import UIKit

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var SVController = SelectedVerseViewController()
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let indexPath = SVController.tableView.indexPathForSelectedRow
        UserDefaults.standard.set(indexPath, forKey: "lastViewedRow")
        SVController.tableView.reloadData()
        SVController.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }

    
func applicationWillEnterForeground(_ application: UIApplication) {
    let indexPath = UserDefaults.standard.object(forKey: "lastViewedRow") as? IndexPath
    SVController.tableView.reloadData()
    if let indexPath = indexPath {
        SVController.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }
}

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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


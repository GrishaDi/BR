//
//  AppDelegate.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let containerVC = ContainerViewController()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = containerVC
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .dark
        self.window = window
                
        let coordinator = AppCoordinator()
        coordinator.start()
        
        return true
    }
}


//
//  AppDelegate.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let containerVC = ContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = ContainerViewController()
        window.rootViewController = containerVC
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .dark
        self.window = window
                
        let coordinator = AppCoordinator()
        coordinator.start()
        
//        containerVC.setupAuthFlowScreen()
//        containerVC.setupMainFlowScreen()
        
        return true
    }
}


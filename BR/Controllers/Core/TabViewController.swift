//
//  TabBarViewController.swift
//  BR
//
//  Created by Grisha Diehl on 11.02.2023.
//

import UIKit

final class TabViewController: UITabBarController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabs()
    }

    private func setUpTabs () {
        let mainVC = MainViewController()
        let settingsVC = SettingsViewController()
        
        mainVC.title = "Main"
        settingsVC.title = "Settings"
        
//        let nav1 = UINavigationController(rootViewController: mainVC)
//        let nav2 = UINavigationController(rootViewController: settingsVC)
        
        setViewControllers(
            [mainVC, settingsVC],
            animated: true
        )
    }
}

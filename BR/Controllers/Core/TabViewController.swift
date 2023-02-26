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
        let estateVC = EstateViewController()
        let presentationVC = PresentationViewController()
        let settingsVC = SettingsViewController()
        
        estateVC.navigationItem.largeTitleDisplayMode = .automatic
        presentationVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: estateVC)
        let nav2 = UINavigationController(rootViewController: presentationVC)
        let nav3 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Estate",
                                       image: UIImage(systemName: "house"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Presentation",
                                       image: UIImage(systemName: "square.and.arrow.up.on.square"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "gear"),
                                       tag: 3)
        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3],
            animated: false
        )
        
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.systemPurple],
            for: .normal
        )
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.systemRed],
            for: .selected
        )
        UITabBar.appearance().tintColor = .systemRed
        UITabBar.appearance().unselectedItemTintColor = .systemPurple
    }
}

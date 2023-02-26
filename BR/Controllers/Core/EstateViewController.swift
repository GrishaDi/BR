//
//  MainViewController.swift
//  BR
//
//  Created by Grisha Diehl on 19.02.2023.
//

import UIKit

final class EstateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Estate"
        view.backgroundColor = .systemBackground
        
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .systemRed
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                                UIColor.systemRed]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                            UIColor.systemRed]
    }
}

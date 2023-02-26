//
//  PresentationViewController.swift
//  BR
//
//  Created by Grisha Diehl on 25.02.2023.
//

import UIKit

final class PresentationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Presentation"
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

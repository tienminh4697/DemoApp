//
//  HomeViewController.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - IBOulets
    @IBOutlet private var homeView: UIView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
}

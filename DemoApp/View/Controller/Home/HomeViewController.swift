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
        showTutorial()
    }

    // MARK: - Private func
    private func showTutorial() {
        let tutorial = TutorialHomeView()
        tutorial.frame = CGRect(x: 0, y:0 , width: homeView.bounds.width, height: 777)
        homeView.addSubview(tutorial)
    }
}

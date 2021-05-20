//
//  TabbarViewController.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import UIKit

class TabbarViewController: UIViewController {

    @IBOutlet private weak var tabbarView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var homeView: UIView!
    @IBOutlet private weak var homeLabel: UILabel!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var profileView: UIView!
    @IBOutlet private weak var homeImage: UIImageView!
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var searchImage: UIImageView!
    @IBOutlet private weak var tabbarHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet var tabbarButtons: [UIButton]!

    private let homeVC = HomeViewController()
    private let searchVC = SearchViewController()
    private let profileVC = ProfileViewController()
    private var selectedIndex: Int = 0
    private var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
    }

    private func configTabbar() {
        let homeNavi = UINavigationController(rootViewController: homeVC)
        let searchNavi = UINavigationController(rootViewController: searchVC)
        let profileNavi = UINavigationController(rootViewController: profileVC)
        viewControllers = [homeNavi, searchNavi,profileNavi]
        tabbarButtons[selectedIndex].isSelected = true
        tabbarButtonTouchUpInside(tabbarButtons[selectedIndex])
        tabbarView.layer.borderWidth = 0.2
        tabbarView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tabbarView.layer.cornerRadius = tabbarHeightContraint.constant / 2
        homeBtn.layer.cornerRadius = (tabbarHeightContraint.constant - 30) / 2
    }

    private func commentTextViewDidTapped() {
        tabbarView.isHidden = true
    }

    private func showTabbar() {
        tabbarView.isHidden = false
    }

    @IBAction func tabbarButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            homeImage.tintColor = .black
            homeLabel.textColor = .black
            searchImage.tintColor = .gray
            profileImage.tintColor = .gray
        } else if sender.tag == 1 {
            homeImage.tintColor = .gray
            homeLabel.textColor = .gray
            searchImage.tintColor = .black
            profileImage.tintColor = .gray
        } else {
            homeImage.tintColor = .gray
            homeLabel.textColor = .gray
            searchImage.tintColor = .gray
            profileImage.tintColor = .black
        }
        selectedIndex = sender.tag
        let previousVC = viewControllers[selectedIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        sender.isSelected = true
        let viewcontroller = viewControllers[selectedIndex]
        addChild(viewcontroller)
        viewcontroller.view.frame = containerView.bounds
        containerView.addSubview(viewcontroller.view)
        viewcontroller.didMove(toParent: self)
    }
}

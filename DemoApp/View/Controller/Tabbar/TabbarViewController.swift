//
//  TabbarViewController.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import UIKit

final class TabbarViewController: UIViewController {

    // MARK: - @IBOutlets
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
    @IBOutlet private weak var homeBtn: UIButton!
    @IBOutlet var tabbarButtons: [UIButton]!

    // MARK: - Peroperties
    private let homeVC = HomeViewController()
    private let searchVC = SearchViewController()
    private let profileVC = ProfileViewController()
    private var selectedIndex: Int = 0
    private var viewControllers: [UIViewController] = []

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
    }

    // MARK: - Private func
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

    // MARK: - @IBActions
    @IBAction func tabbarButtonTouchUpInside(_ sender: UIButton) {
        if sender.tag == 0 {
            homeImage.tintColor = App.Color.tabbarButton
            homeLabel.textColor = App.Color.tabbarButton
            searchImage.tintColor = App.Color.tabbarButons
            profileImage.tintColor = App.Color.tabbarButons
        } else if sender.tag == 1 {
            homeImage.tintColor = App.Color.tabbarButons
            homeLabel.textColor = App.Color.tabbarButons
            searchImage.tintColor = App.Color.tabbarButton
            profileImage.tintColor = App.Color.tabbarButons
        } else {
            homeImage.tintColor = App.Color.tabbarButons
            homeLabel.textColor = App.Color.tabbarButons
            searchImage.tintColor = App.Color.tabbarButons
            profileImage.tintColor = App.Color.tabbarButton
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

//
//  ProfileViewController.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import UIKit
import FBSDKLoginKit

final class ProfileViewController: UIViewController {

    // MARK: - Peroperties
    let loginmanage = LoginManager()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
    }

    // MARK: - IBActions
    @IBAction private func logOutButtonTouchUpInside(_ sender: UIButton) {
        AccessToken.current = nil
        loginmanage.logOut()
        AppDelegate.shared.setRoot(rootType: .login)
    }
}

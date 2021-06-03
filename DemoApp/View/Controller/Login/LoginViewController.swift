//
//  LoginViewController.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import UIKit
import Combine
import FBSDKCoreKit
import FBSDKLoginKit

final class LoginViewController: UIViewController {

    // MARK: - Enum
    enum LoginType {
        case facebook
        case google
        case zalo
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var gmailTextField: UITextField!
    @IBOutlet private weak var passTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var loginbyFBButton: UIButton!

    let loginManager = LoginManager()
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigUI()
    }

    // MARK: - Private func
    private func cofigUI() {
        contentView.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = App.Color.mainColor
    }

    private func handleLogin(_ type: LoginType) {
        switch type {
        case .facebook:
            if AccessToken.current != nil {
                loginManager.logOut()
            } else {
                loginManager.logIn(permissions: [], from: self) { (result, error) in
                    guard error == nil else { return }
                    guard let result = result, !result.isCancelled else { return }
                    Profile.loadCurrentProfile { (profile, _) in
                        guard let profile = profile else { return }
                        print("\(profile.userID)")
                        Session.shared.isLogin = true
                        AppDelegate.shared.setRoot(rootType: .tabbar)
                    }
                }
            }
        case .google: break
        case .zalo: break
        }
    }

    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
    }

    @IBAction private func googleLoginTouchUpInside(_ sender: UIButton) {
    }

    @IBAction private func facebookLoginTouchInSide(_ sender: UIButton) {
        handleLogin(.facebook)
    }

    @IBAction private func zaloLoginTouchUpInside(_ sender: UIButton) {
    }
}

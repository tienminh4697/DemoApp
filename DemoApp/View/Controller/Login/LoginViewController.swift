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
        case normal
        case facebook
        case google
        case zalo
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var gmailTextField: UITextField!
    @IBOutlet private weak var passTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    let fbLoginButton: FBLoginButton = FBLoginButton()

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

    // MARK: - IBActions
    @IBAction private func loginButtonTouchUpInside(_ sender: UIButton) {
    }

    @IBAction private func googleLoginTouchUpInside(_ sender: UIButton) {
    }

    @IBAction private func facebookLoginTouchInSide(_ sender: UIButton) {
        print("facebook login")
        fbLoginButton.delegate = self
    }

    @IBAction private func zaloLoginTouchUpInside(_ sender: UIButton) {
    }
}

extension LoginViewController: LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        // logout
    }

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        // result
    }
}

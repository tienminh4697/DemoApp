//
//  AppDelegate.swift
//  DemoApp
//
//  Created by T.Minh on 5/19/21.
//

import UIKit
import UserNotifications

enum RootType {
    case login
    case tabbar
}

let userdefault = UserDefaults.standard
let screenSize = UIScreen.main.bounds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configWindow()
        return true
    }

    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        if !Session.shared.isLogin {
            setRoot(rootType: .tabbar)
        } else {
            setRoot(rootType: .tabbar)
        }
    }

    func setRoot(rootType: RootType) {
        switch rootType {
        case .login:
            Session.shared.clearData()
            window?.rootViewController = LoginViewController()
        case .tabbar:
            Session.shared.isLogin = true
            window?.rootViewController = TabbarViewController()
        }
    }
}

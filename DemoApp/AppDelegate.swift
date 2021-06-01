//
//  AppDelegate.swift
//  DemoApp
//
//  Created by T.Minh on 5/19/21.
//

import UIKit
import UserNotifications
import FBSDKCoreKit

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
        userdefault.set(false, forKey: App.UserDefaultKey.isLogin)
        ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions)
        configWindow()
        return true
    }

    func application( _ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
        ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
    }

    private func configWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        if Session.shared.isLogin {
            setRoot(rootType: .tabbar)
        } else {
            setRoot(rootType: .login)
        }
    }

    func setRoot(rootType: RootType) {
        switch rootType {
        case .login:
            Session.shared.clearData()
            window?.rootViewController = HomeViewController()
        case .tabbar:
            Session.shared.isLogin = true
            window?.rootViewController = TabbarViewController()
        }
    }
}

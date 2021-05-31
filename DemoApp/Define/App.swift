//
//  App.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import Foundation
import UIKit

struct App {

    struct Configurations { }

    struct Color { }

    struct Texts { }

    struct Fonts { }
}

extension App {

    struct UserDefaultKey {
        static let isLogin = "isLogin"
        static let userID = "userID"
        static let userEmail = "userEmail"
        static let userName = "userName"
        static let userImageURL = "userImageURL"
        static let accessToken = "accesstoken"
    }
}

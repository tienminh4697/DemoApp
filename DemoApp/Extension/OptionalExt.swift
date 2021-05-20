//
//  OptionalExt.swift
//  DemoApp
//
//  Created by T.Minh on 5/20/21.
//

import Foundation
extension Optional {

    func unwrapped(or defaultValue: Wrapped) -> Wrapped {
        return self ?? defaultValue
    }

    func unwrapped(or error: Error) throws -> Wrapped {
        guard let wrapped = self else { throw error }
        return wrapped
    }
}

//
//  UserDefault.swift
//  MinimalFood
//
//  Created by Emanuele Bazzicalupo on 15/12/24.
//

import SwiftUI

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}

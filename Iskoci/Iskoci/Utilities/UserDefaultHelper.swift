//
//  UserDefaultHelper.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 22.11.23..
//

import Foundation

struct UserDefaultHelper {
    public enum Keys{
        case isRegistred
        case userId
        var value: String {
            switch self {
            case .isRegistred:
                return "isRegistred"
            case .userId:
                return "userId"
            }
        }
    }
    static var shared = UserDefaultHelper()
    
    private init() {}
    
    var userId: String? {
        get {
            UserDefaults.standard.string(forKey: Keys.userId.value)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.userId.value)
        }
    }
    var isRegistred: Bool? {
        get {
            UserDefaults.standard.bool(forKey: Keys.isRegistred.value)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.isRegistred.value)
        }
    }
}

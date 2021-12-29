//
//  UserDefaultsHelper.swift
//  Eyva
//
//  Created by Muralitharan Govindaraj on 29/12/21.
//

import Foundation

class UserDefaultsHelper {
    
    static let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case userDetailsSaved
    }
    
    class func setuserDetailsIsSaved() {
        userDefaults.set(true, forKey: Key.userDetailsSaved.rawValue)
    }
    
    class func getUserDetailsSavedState() -> Bool {
        return userDefaults.bool(forKey: Key.userDetailsSaved.rawValue)
    }
}

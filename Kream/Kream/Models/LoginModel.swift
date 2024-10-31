//
//  LoginModel.swift
//  Kream
//
//  Created by 선가연 on 10/6/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    private let userIdKey: String = "userId"
    private let userPasswordKey: String = "userPassword"
    
    // 유저 아이디와 비밀번호 저장
    public func saveUserCredentials(id: String, password: String) {
        userDefaults.set(id, forKey: userIdKey)
        userDefaults.set(password, forKey: userPasswordKey)
    }
    
    // 유저 아이디 로드
    public func loadUserId() -> String? {
        return userDefaults.string(forKey: userIdKey)
    }
    
    // 유저 비밀번호 로드
    public func loadUserPassword() -> String? {
        return userDefaults.string(forKey: userPasswordKey)
    }
}

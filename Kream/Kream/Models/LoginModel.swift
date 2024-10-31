//
//  LoginModel.swift
//  Kream
//
//  Created by 선가연 on 10/6/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    private let userEmailKey: String = "email"
    private let userPasswordKey: String = "password"
    
    // 유저 이메일 저장
    public func saveUserEmail(_ email: String) {
        userDefaults.set(email, forKey: userEmailKey)
    }
    
    // 유저 비밀번호 저장
    public func saveUserPassword(_ password: String) {
        userDefaults.set(password, forKey: userPasswordKey)
    }
    
    // 유저 이메일 로드
    public func loadUserEmail() -> String? {
        return userDefaults.string(forKey: userEmailKey)
    }
    
    // 유저 비밀번호 로드
    public func loadUserPassword() -> String? {
        return userDefaults.string(forKey: userPasswordKey)
    }
}

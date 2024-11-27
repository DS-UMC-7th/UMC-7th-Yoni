//
//  KeychainService.swift
//  Kream
//
//  Created by 선가연 on 11/27/24.
//

import Foundation
import Security

class KeychainService {
    
    static let shared = KeychainService()
    
    private init() {}
    
    // 토큰 및 닉네임 저장
    func saveToken(token: String, nickname: String) {
        let tokenData = token.data(using: .utf8)!
        let nicknameData = nickname.data(using: .utf8)!
        
        // Access Control 설정 (Face ID 또는 기기 잠금 해제 후 접근 가능)
        guard let accessControl = SecAccessControlCreateWithFlags(
            kCFAllocatorDefault,
            kSecAttrAccessibleWhenUnlocked,
            .userPresence,   // 사용자 인증 (Face ID, Touch ID 또는 기기 암호)
            nil
        ) else {
            print("Failed to create access control")
            return
        }
        
        // 토큰 저장
        let tokenQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "accessToken",
            kSecValueData as String: tokenData,
            kSecAttrAccessControl as String: accessControl
        ]
        
        // 기존 토큰 데이터 삭제 후 저장
        SecItemDelete(tokenQuery as CFDictionary)
        let tokenStatus = SecItemAdd(tokenQuery as CFDictionary, nil)
        if tokenStatus != errSecSuccess {
            print("Failed to save token with error code: \(tokenStatus)")
        }
        
        // 닉네임 저장
        let nicknameQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "nickname",
            kSecValueData as String: nicknameData,
            kSecAttrAccessControl as String: accessControl
        ]
        
        // 기존 닉네임 데이터 삭제 후 저장
        SecItemDelete(nicknameQuery as CFDictionary)
        let nicknameStatus = SecItemAdd(nicknameQuery as CFDictionary, nil)
        if nicknameStatus != errSecSuccess {
            print("Failed to save nickname with error code: \(nicknameStatus)")
        }
    }
    
    // 닉네임 불러오기
    func loadNickname() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "nickname",
            kSecReturnData as String: true,                 // 데이터를 반환하도록 설정
            kSecMatchLimit as String: kSecMatchLimitOne     // 하나의 결과만 반환
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else {
            print("Failed to fetch nickname with error code: \(status)")
            return nil
        }
        
        if let data = item as? Data, let nickname = String(data: data, encoding: .utf8) {
            return nickname
        }
        
        return nil
    }
}

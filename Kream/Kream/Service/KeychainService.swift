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
    @discardableResult
    func saveToken(token: String, nickname: String) -> OSStatus {
        let tokenData = token.data(using: .utf8)!
        
        // Access Control 설정 (Face ID 또는 기기 잠금 해제 후 접근 가능)
        let accessControl = SecAccessControlCreateWithFlags(
            kCFAllocatorDefault,
            kSecAttrAccessibleWhenUnlocked,
            .userPresence,   // 사용자 인증 (Face ID, Touch ID 또는 기기 암호)
            nil
        )
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 일반 데이터 저장
            kSecAttrAccount as String: nickname,             // 닉네임
            kSecValueData as String: tokenData,             // 실제 토큰 데이터
            kSecAttrAccessControl as String: accessControl! // 접근 제어 추가
        ]
        
        // 기존 항목 삭제 후 새로운 항목 저장
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    // 토큰 불러오기
    func loadToken(nickname: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: nickname,
            kSecReturnData as String: true,                 // 데이터를 반환하도록 설정
            kSecMatchLimit as String: kSecMatchLimitOne     // 하나의 결과만 반환
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess else { return nil }
        
        if let data = item as? Data, let token = String(data: data, encoding: .utf8) {
            return token
        }
        
        return nil
    }
    
    // 토큰 삭제
    @discardableResult
    func deleteToken(nickname: String) -> OSStatus {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: nickname
        ]
        
        return SecItemDelete(query as CFDictionary)
    }
}

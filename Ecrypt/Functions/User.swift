//
//  User.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 19/5/2024.
//

import Foundation
import SwiftUI
import CryptoKit
import Security

class User {
    
    let savePath = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appending(path: "Ecrypt")
    let userSavePath: URL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt/U-001.EcSUF")
    let userUUID: NSUUID
    let password: SHA512Digest
    let salt: String
    var isBioAuth: Bool = false
    var nickname: String
    
    init(psword: String, nckname: String) {
        
        nickname = nckname
        userUUID = NSUUID()
        salt = NSUUID().uuidString
        password = SHA512.hash(data: psword.data(using: .utf8)!)
        if FileManager.default.fileExists(atPath: userSavePath.path()) {
            //smth
        } else {
            if FileManager.default.createFile(atPath: userSavePath.path(), contents: nil, attributes: nil) {
                do {
                    try userUUID.uuidString.write(toFile: userSavePath.path(), atomically: true, encoding: .utf8)
                } catch {
                    //aggggggg
                }
            }
        }
    }
    
    func saveUserInfo (userUUID: NSUUID, password: SHA512Digest, salt: String, nickname: String, isBioAuth: Bool) {
        
        if FileManager.default.fileExists(atPath: savePath.path()) {
            //home
        }
        
    }
    
}

///let addQuery: [String: Any] = [kSecClass as String: kSecClassKey,
///                       kSecAttrApplicationTag as String: "com.Ecrypt.UUID".data(using: .utf8)!,
///                       kSecValueRef as String: self.userUUID]
///let status = SecItemAdd(addQuery as CFDictionary, nil)

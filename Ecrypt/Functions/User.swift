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
    
    let savePath = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path: "Ecrypt")
    let userSavePath: URL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt")
    let userUUID: NSUUID
    let encodedUserUUID: Data
    let password: SHA512Digest
    let salt: String
    var isBioAuth: Bool
    var nickname: String
    
    init(psword: String, nckname: String, isBioAuthed: Bool) {
        
        if !FileManager.default.fileExists(atPath: userSavePath.path()) {
            nickname = nckname
            userUUID = NSUUID()
            encodedUserUUID = userUUID.uuidString.data(using: .utf8)!
            salt = NSUUID().uuidString
            isBioAuth = isBioAuthed
            password = SHA512.hash(data: psword.data(using: .utf8)!)
            do {
                try FileManager.default.createDirectory(atPath: savePath.path(), withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
            do {
                FileManager.default.createFile(atPath: userSavePath.path(), contents: encodedUserUUID)
            }
        } else {
            do {
                encodedUserUUID = try String(contentsOf: userSavePath, encoding: .utf8).data(using: .utf8)!
                userUUID = NSUUID(uuidString: encodedUserUUID.base64EncodedString())!
                password = SHA512.hash(data: "d".data(using: .utf8)!)
                salt = ""
                isBioAuth = true
                nickname = ""
                
            } catch {
                print(error.localizedDescription)
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

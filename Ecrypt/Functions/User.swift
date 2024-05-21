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
    
    @Published var userInfo: [String] = []
    let savePath = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path: "Ecrypt")
    let userSavePath: URL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt")
    let userSavePath2: URL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "B-MC2.txt")
    var userUUID: String
    var password: String
    var isBioAuth: Bool
    var nickname: String
    var saveInfo: String = ""
    var temp: [String] = [""]
    var temp1: String = ""
    
    init(psword: String, nckname: String, isBioAuthed: Bool) {
        nickname = nckname
        userUUID = NSUUID().uuidString
        password = SHA512.hash(data: psword.data(using: .utf8)!).description.lowercased()
        isBioAuth = isBioAuthed
        saveInfo = userUUID + "|"
        saveInfo.append(isBioAuth ? "1|" : "0|")
        saveInfo.append(nickname)
        saveInfo.append("|")
        saveInfo.append(password)
        try! FileManager.default.createDirectory(atPath: savePath.path(), withIntermediateDirectories: true, attributes: nil)
        FileManager.default.createFile(atPath: userSavePath.path(), contents: userUUID.data(using: .utf8))
        try! saveInfo.write(to: userSavePath, atomically: false, encoding: .utf8)
        try! FileManager.default.createDirectory(atPath: savePath.path(), withIntermediateDirectories: true, attributes: nil)
        FileManager.default.createFile(atPath: userSavePath2.path(), contents: userUUID.data(using: .utf8))
        try! saveInfo.write(to: userSavePath2, atomically: false, encoding: .utf8)
        print("another day another slay")
    }
    
    init () throws {
        try temp1 = String(contentsOf: userSavePath)
        temp = temp1.components(separatedBy: "|")
        userUUID = temp[0]
        if temp[1] == "0" {
            isBioAuth = false
        } else {
            isBioAuth = true
        }
        nickname = temp[2]
        password = temp[3]
    }
    
    
}

///let addQuery: [String: Any] = [kSecClass as String: kSecClassKey,
///                       kSecAttrApplicationTag as String: "com.Ecrypt.UUID".data(using: .utf8)!,
///                       kSecValueRef as String: self.userUUID]
///let status = SecItemAdd(addQuery as CFDictionary, nil)

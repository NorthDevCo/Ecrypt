//
//  retrieveDetails.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 22/5/2024.
//

import Foundation

func retrieveNickname() -> String {
    let temp1 = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt"))
    let temp = temp1.components(separatedBy: "|")
    let nickname = temp[2]
    return nickname
}

func retrievePassword() -> String {
    let temp1 = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt"))
    let temp = temp1.components(separatedBy: "|")
    let password = temp[3]
    return password
}

func retrieveIsBioAuth () -> Bool {
    let temp1 = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt"))
    let temp = temp1.components(separatedBy: "|")
    let isBioAuth = temp[1]
    if isBioAuth == "1" {
        return true
    } else {
        return false
    }
}

func retrieveUserUUID () -> String {
    let temp1 = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt"))
    let temp = temp1.components(separatedBy: "|")
    let userUUID = temp[0]
    return userUUID
}

func retrieveFiles () -> String {
    let temp1 = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "B-MC2.txt"))
    return temp1
}

func updateIsBioAuth (isAuth: Bool) {
    let nickname = retrieveNickname()
    let password = retrievePassword()
    let userUUID = retrieveUserUUID()
    let files = retrieveFiles()
    deleteUserAccount()
    let user = User(pssword: password, nckname: nickname, isBioAuthed: isAuth, UserUUID: userUUID, files: files)
}

func updateNickname (nickname: String) {
    let isBioAuthed = retrieveIsBioAuth()
    let password = retrievePassword()
    let userUUID = retrieveUserUUID()
    let files = retrieveFiles()
    deleteUserAccount()
    let user = User(pssword: password, nckname: nickname, isBioAuthed: isBioAuthed, UserUUID: userUUID, files: files)
}

func deleteUserAccount () {
    try! FileManager.default.removeItem(atPath: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").path())
}

func favoritesLength () -> Int {
    let temp = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "B-MC2.txt"))
    let temo1 = temp.components(separatedBy: "Ω")
    let amount = temo1.count
    return amount
}

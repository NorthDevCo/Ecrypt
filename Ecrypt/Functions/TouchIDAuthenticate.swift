//
//  TouchIDAuthenticate.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/4/2024.
//

import Foundation
import LocalAuthentication

func isDeviceSupportedforAuth () -> Bool {
    let userSavePath: URL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt")
    let userSavePath2: URL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "B-MC2.txt")
    let temp1 = try! String(contentsOf: userSavePath)
    let temp2 = try! String(contentsOf: userSavePath2)
    let temp11 = temp1.components(separatedBy: "|")
    let temp22 = temp2.components(separatedBy: "|")
    var matchingUserUUID = false
    if temp22[1] == temp11[1] {
        matchingUserUUID = true
    }
    let context = LAContext()
    var policy: LAPolicy?
    policy = .deviceOwnerAuthenticationWithBiometrics
    var LAError: NSError?
    guard context.canEvaluatePolicy(policy!, error: &LAError) else {
        return false
    }
    if !matchingUserUUID {
        return false
    }
    return true
}


func touchIDAuthenticate(appState: AppState) {
    let context = LAContext()
    let policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics
    let reason = "TouchID for Ecrypt"
    context.evaluatePolicy(policy, localizedReason: reason) { success, err in
        if success {
            DispatchQueue.main.async {
                appState.clear(.MainView)
            }
        } else {
            
        }
    }
}

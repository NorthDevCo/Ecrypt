//
//  TouchIDAuthenticate.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/4/2024.
//

import Foundation
import LocalAuthentication

func isDeviceSupportedforAuth () -> Bool {
    let context = LAContext()
    var policy: LAPolicy?
    policy = .deviceOwnerAuthenticationWithBiometrics
    var err: NSError?
    guard context.canEvaluatePolicy(policy!, error: &err) else {
        return false
    }
    return true
}


func touchIDAuthenticate(appstate: AppState) {
    let context = LAContext()
    var err: NSError?
    let reason = "TouchID for Ecrypt"
    context.evaluatePolicy(
        .deviceOwnerAuthenticationWithBiometrics,
        localizedReason: reason
    ) { success, err in
        if success {
            appstate.clear(.MainView)
        } else {
            
        }
    }
}

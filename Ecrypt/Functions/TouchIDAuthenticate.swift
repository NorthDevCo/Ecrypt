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
    var LAError: NSError?
    guard context.canEvaluatePolicy(policy!, error: &LAError) else {
        return false
    }
    if !retrieveIsBioAuth() {
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

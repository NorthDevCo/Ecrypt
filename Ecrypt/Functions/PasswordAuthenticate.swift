//
//  PasswordAuthenticate.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/4/2024.
//

import Foundation
import CryptoKit

func passwordAuthenticate(_ password: String, appState: AppState) {
    let temp = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt"))
    let temp1 = temp.components(separatedBy: "|")
    let password1 = temp1[3]
    let password2 = SHA512.hash(data: password.data(using: .utf8)!).description.lowercased()
    
    if password2 == password1 {
        DispatchQueue.main.async {
            appState.clear(.MainView)
        }
    }
            
}

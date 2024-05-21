//
//  SettingsView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/5/2024.
//

import SwiftUI
import Security

struct SettingsView: View {
    
    @State var nickname: String
    @State var isOn: Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            Toggle("I consent to sign in with Biometrics", isOn: $isOn)
        }
    }
    
    private func deleteUserAccount (username: String) throws {
        try FileManager.default.removeItem(atPath: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "U-001.txt").path())
    }
}

#Preview {
    SettingsView(nickname: "poop", isOn: true)
}

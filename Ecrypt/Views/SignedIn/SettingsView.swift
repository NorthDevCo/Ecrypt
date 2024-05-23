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
    @State var isOn: Bool = retrieveIsBioAuth()
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Fingerprint autherisation is currently approved: \(isOn ? "True" : "False")")
                Button(action: {
                    isOn.toggle()
                    updateIsBioAuth(isAuth: isOn)
                }, label: {
                    Text("Change")
                })
            }
            
            HStack {
                Text("Delete User Account")
                Button(action: {
                    deleteUserAccount()
                }, label: {
                    Text("Delete")
                })
            }
            
        }
    }
}

#Preview {
    SettingsView(nickname: "poop", isOn: true)
}

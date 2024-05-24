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
            
            Button(action: {
                NSWorkspace.shared.open(URL(string: "https://github.com/NorthDevCo/Ecrypt/blob/984b0cf47a79502c9e1db3bde1c658503a292bfc/Ecrypt%20Terms%20of%20Service.pdf")!)
            }, label: {
                Text("Read Terms of Service")
            })
            
        }
    }
}

#Preview {
    SettingsView(nickname: "poop", isOn: true)
}

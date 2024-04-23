//
//  RegistrationView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 19/4/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Image(systemName: "person.3")
                Text("Registration View")
            }
            
            HStack {
                Button(action: {
                    appState.pop()
                }, label: {
                    HStack (alignment: .center) {
                        Text("Back")
                    }
                })
                Button(action: {
                    appState.push(.LogInView)
                }, label: {
                    HStack (alignment: .center) {
                        Text("Have an account?")
                        Text("Click Here")
                            .fontWeight(.bold)
                    }
                })
            }
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}

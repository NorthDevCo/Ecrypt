//
//  InputView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 21/4/2024.
//

import SwiftUI

struct inputView: View {
    
    @Binding var text: String
    let placeholder: String
    let title: String
    var isSecureField = false
    var isSignIn = false
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecureField == false {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    inputView(text: .constant(""), placeholder: "Name@EmailExample.com", title: "Email Address", isSecureField: true)
}

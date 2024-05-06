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
    let imageName: String
    var isSecureField = false
    var isSignIn = false
    
    var body: some View {
        VStack (alignment: .leading){
            Text(title)
                .fontWeight(.semibold)
                .font(.footnote)
            
            ZStack (alignment: .leading){
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: 400, height: 40)
                
                if isSecureField == true {
                    HStack {
                        Image(systemName: imageName)
                            .padding(.horizontal, imageName.isEmpty ? 0 : 10)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .font(.title2)
                        SecureField(placeholder, text: $text)
                            .font(.system(size: 14))
                            .textFieldStyle(.plain)
                            .frame(width: 340)
                    }
                } else {
                    HStack {
                        Image(systemName: imageName)
                            .padding(.horizontal, imageName.isEmpty ? 0 : 10)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .font(.title2)
                        TextField(placeholder, text: $text)
                            .font(.system(size: 14))
                            .textFieldStyle(.plain)
                            .frame(width: 340)
                    }
                }

            }
        }
    }
}

private func characterFilter(password: String) -> String {
    return password
}

#Preview {
    inputView(text: .constant(""), placeholder: "Name@EmailExample.com", title: "Email Address", imageName: "envelope", isSecureField: true)
}

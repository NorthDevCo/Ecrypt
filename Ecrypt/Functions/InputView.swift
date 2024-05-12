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
                            .onChange(of: text) {
                                text = characterFilter(Password: text)
                            }
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
                            .onChange(of: text) {
                                text = characterFilter(Password: text)
                            }
                    }
                }

            }
        }
    }
}

private func characterFilter(Password: String) -> String {
    var password = Password
    let passwordRegEx: Set<Character> = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","!","@","#","$","%","^","&","*","(",")","-","_","+","=",",",".","<",">","?","/","'",":",";","{","[","]","}","|","1","2","3","4","5","6","7","8","9","0","`","~"]
    password = password.filter( passwordRegEx.contains(_:))
    return password
}

#Preview {
    inputView(text: .constant(""), placeholder: "Name@EmailExample.com", title: "Email Address", imageName: "envelope", isSecureField: true)
}

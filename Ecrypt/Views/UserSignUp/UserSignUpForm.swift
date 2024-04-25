//
//  UserSignUpForm.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 25/4/2024.
//

import SwiftUI

struct UserSignUpForm: View {
    
    @State var progress: Int = 0
    @State var password: String = ""

    
    var body: some View {
        if progress == 0 {
            VStack (alignment: .leading){
                Spacer(minLength: 60)
                HStack {
                    inputView(text: $password, placeholder: "Enter a password", title: "Create a Password", imageName: "lock", isSecureField: secureField)
                        .padding(.bottom, 6)
                    Button(action: {
                        if secureField == true {
                            secureField = false
                        } else {
                            secureField = true
                        }
                    }, label: {
                        Text(secureField == true ? "Show" : "Hide")
                    }).buttonStyle(.borderless)
                    .padding(.top, 10)
                }
                HStack {
                    Text("Weak")
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 300, height: 10)
                            .foregroundStyle(Color(NSColor(white: 0.4, alpha: 0.2)))
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: CGFloat(passwordStrength(password)*60), height: 10)
                            .foregroundStyle(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                    }
                    Text("Strong")
                }
                Spacer(minLength: 60)
                Text("To continue read and agree to the Terms of Service")
                Toggle(isOn: $isOn, label: {
                    Text("I agree to the Terms of Service")
                })
                Spacer(minLength: 60)
                
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Spacer(minLength: 87.5)
                            Text("Continue")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(passwordTesting(password) && isOn ? .white : .gray)
                            Spacer()
                            Image(systemName: "arrow.forward")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(passwordTesting(password) && isOn ? .white : .gray)
                        }.onTapGesture {
                            progress = 1
                        }
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(passwordTesting(password) && isOn ? .blue : .clear).stroke(passwordTesting(password) && isOn ? .blue : .gray, lineWidth: 3).frame(width: 300, height: 50))
                        Spacer()
                        Text("Terms of Service")
                            .onTapGesture {
                                // make some new window with terms of service
                            }                    }
                    Spacer(minLength: 60)
                }
            }
        } else if progress == 1 {
            Text("biometrics")
        } else if progress == 2 {
            Text("forgot password")
        } else {
            Text("completed welcome")
        }
    }
    
    private func passwordStrength (_ Password: String) -> Int {
        let specials = "!@#$%^&*()_-+={[}]|:;<,>'.?/~`"
        let capitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        let numbers = "1234567890"
        var strength = 0
        var count = 0
        if Password.count >= 14 {
            strength += 1
        }
        for letter in Password {
            if specials.contains(letter) {
                count += 1
            }
        }
        if count >= 2 {
            strength += 1
        }
        count = 0
        for letter in Password {
            if numbers.contains(letter) {
                count += 1
            }
        }
        if count >= 3 {
            strength += 1
        }
        count = 0
        for letter in Password {
            if capitals.contains(letter) {
                count += 1
            }
        }
        if count >= 3 {
            strength += 1
        }
        count = 0
        for letter in Password {
            if lowercase.contains(letter) {
                count += 1
            }
        }
        if count >= 2 {
            strength += 1
        }
        return strength
    }
    
    private func passwordTesting (_ Password: String) -> Bool {
        var count: Int = 0
        let specials = "!@#$%^&*()_-+={[}]|:;<,>'.?/~`"
        let capitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let lowercase = "abcdefghijklmnopqrstuvwxyz"
        let numbers = "1234567890"
        if Password.count < 10 {
            return false
        }
        for letter in Password {
            if specials.contains(letter) {
                count += 1
            }
        }
        if count < 1 {
            return false
        }
        count = 0
        for letter in Password {
            if numbers.contains(letter) {
                count += 1
            }
        }
        if count < 1 {
            return false
        }
        count = 0
        for letter in Password {
            if capitals.contains(letter) {
                count += 1
            }
        }
        if count < 1 {
            return false
        }
        count = 0
        for letter in Password {
            if lowercase.contains(letter) {
                count += 1
            }
        }
        if count < 1 {
            return false
        }
        for perms in passwordPermutations {
            if password.contains(perms) {
                return false
            }
        }
        return true
    }
}

#Preview {
    UserSignUpForm(progress: 0, password: "&6MonkeysRL0oking^")
}

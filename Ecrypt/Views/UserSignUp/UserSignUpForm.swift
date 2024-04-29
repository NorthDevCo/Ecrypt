//
//  UserSignUpForm.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 25/4/2024.
//

import SwiftUI

struct UserSignUpForm: View {
    
    @EnvironmentObject private var appState: AppState
    @State var progress: Int = 0
    @State private var password: String = ""
    @State private var password1: String = ""
    @State var secureField: Bool = true
    @State private var isOn: Bool = false
    @State private var overText: Bool = false
    @State private var overText1: Bool = false
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        if progress >= 3 {
            ProgressBar(progress: progress)
            Text("completed welcome")
        } else if progress == 2 {
            ProgressBar(progress: progress)
            Text("forgot password")
        } else if progress == 1{
            ProgressBar(progress: progress)
            Spacer()
            Text("biometrics")
            Spacer()
        } else {
            VStack (alignment: .leading, content: {

                ProgressBar(progress: progress)
                HStack {
                    inputView(text: $password, placeholder: "Enter a password", title: "Create a Password", imageName: "", isSecureField: secureField)
                        .padding(.bottom, 6)
                        .overlay(alignment: .trailing) {
                            Button(action: {
                                if secureField == true {
                                    secureField = false
                                } else {
                                    secureField = true
                                }
                            }, label: {
                                Image(systemName: secureField ? "eye" : "eye.slash")
                                    .font(.title2)
                            }).buttonStyle(.borderless)
                                .padding(.top, 13)
                                .padding(.trailing, 10)
                        }
                }.padding(.top, 10)
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
                Text("Password must be at least 10 characters")
                    .font(.subheadline)
                    .fontWeight(.light)
                Spacer()
                
                HStack {
                    inputView(text: $password1, placeholder: "Enter a password", title: "Create a Password", imageName: "", isSecureField: secureField)
                        .padding(.bottom, 6)
                        .overlay(alignment: .trailing) {
                            Button(action: {
                                if secureField == true {
                                    secureField = false
                                } else {
                                    secureField = true
                                }
                            }, label: {
                                Image(systemName: secureField ? "eye" : "eye.slash")
                                    .font(.title2)
                            }).buttonStyle(.borderless)
                                .padding(.top, 13)
                                .padding(.trailing, 10)
                        }
                    Image(systemName: "checkmark")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(password == password1 && password1.isEmpty == false ? .green : .clear)
                        .padding(.top, 9)
                }.padding(.top, 10)
                Spacer()
                Text("To continue read and agree to the Terms of Service")
                Toggle(isOn: $isOn, label: {
                    Text("I agree to the Terms of Service")
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            if passwordTesting(password, password1) && isOn {
                                progress = 1
                                // store password and hash for security!!!
                            }
                        }, label: {
                            HStack {
                                Spacer(minLength: 87.5)
                                Text("Continue")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(passwordTesting(password, password1) && isOn ? .white : .gray)
                                Spacer()
                                Image(systemName: "arrow.forward")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(passwordTesting(password, password1) && isOn ? .white : .clear)
                            }
                        }).buttonStyle(.borderless)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(passwordTesting(password, password1) && isOn ? .blue : .clear).stroke(passwordTesting(password, password1) && isOn ? .blue : .gray, lineWidth: 3).frame(width: 300, height: 50))
                        HStack {
                            Text("Terms of Service")
                                .onHover(perform: { over in
                                    overText1 = over
                                })
                                .foregroundStyle(overText1 ? .blue : .primary)
                                .onTapGesture {
                                    openWindow(id: "ToS")
                                }
                            Spacer()
                            Text("Already have and account?")
                                .onHover(perform: { over in
                                    overText = over
                                })
                                .foregroundStyle(overText ? .blue : .primary)
                                .onTapGesture {
                                    appState.clear(.LogInView)
                                }
                        }
                        .frame(width: 300)
                        .padding(.vertical, 10)
                    }
                    Spacer()
                }
            })
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
    
    private func passwordTesting (_ Password: String, _ Password1: String) -> Bool {
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
        if count < 2 {
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
        if Password != Password1 {
            return false
        }
        return true
    }
}

#Preview {
    UserSignUpForm(progress: 0)
}

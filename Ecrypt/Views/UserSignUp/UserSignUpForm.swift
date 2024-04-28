//
//  UserSignUpForm.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 25/4/2024.
//

import SwiftUI

struct UserSignUpForm: View {
    
    @State var progress: Int = 0
    @State private var password: String = ""
    @State var secureField: Bool = true
    @State private var isOn: Bool = false
    
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
        } else {
            VStack (alignment: .leading, content: {

                ProgressBar(progress: progress)
                VStack (alignment: .leading){
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
                }.padding(.vertical)
                VStack (alignment: .leading) {
                    Text("Requirements:")
                    VStack (alignment: .leading) {
                        Text("Min 10 Characters")
                        Text("2 Capitals")
                        Text("1 Number")
                        Text("1 Special Character")
                        Text("Can't be a varient of \"password\"")
                    }.padding(.leading)
                }
                Text("To continue read and agree to the Terms of Service")
                Toggle(isOn: $isOn, label: {
                    Text("I agree to the Terms of Service")
                })
                
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            if passwordTesting(password) && isOn {
                                progress = 1
                            }
                        }, label: {
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
                                    .foregroundStyle(passwordTesting(password) && isOn ? .white : .clear)
                            }
                        }).buttonStyle(.borderless)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(passwordTesting(password) && isOn ? .blue : .clear).stroke(passwordTesting(password) && isOn ? .blue : .gray, lineWidth: 3).frame(width: 300, height: 50))
                        Spacer()
                        Text("Terms of Service")
                            .onTapGesture {
                                // make some new window with terms of service
                            }
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
        return true
    }
}

#Preview {
    UserSignUpForm(progress: 0)
}

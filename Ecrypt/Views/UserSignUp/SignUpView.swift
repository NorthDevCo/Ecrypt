//
//  RegistrationView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 19/4/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject private var appState: AppState
    @State private var progress: Int = 0
    @State private var password: String = ""
    @State private var password1: String = ""
    @State var secureField: Bool = true
    @State private var isOn: Bool = false
    @State var isSelected: Bool = false

    
    var body: some View {
        VStack {
            HStack {
                Text("Ecrypt")
                    .font(.system(size: 25, weight: .medium, design: Font.Design.serif))
                
                Spacer()
                
                Image("Icon_full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }.padding(.horizontal)
            Spacer()
            if progress >= 3 {
                ProgressBar(progress: progress)
                Text("completed welcome")
            } else if progress == 2 {
                PasswordRestoreSaveView(progress: progress)
            } else if progress == 1 {
                ProgressBar(progress: progress)
                Spacer()
                VStack {
                    Text ("Do you consent to using Biometrics to sign in?")
                        .font(.system(size: 20))
                    Image(systemName: "touchid")
                        .font(.system(size: 60))
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .padding()
                    Toggle(isOn: $isSelected, label: {
                        Text("  I agree to use Biometrics to sign in")
                    }).padding()
                }
                Button(action: {
                        progress = 2
                }, label: {
                    HStack {
                        Spacer(minLength: 87.5)
                        Text("Continue")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        Spacer()
                        Image(systemName: "arrow.forward")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                }).buttonStyle(.borderless)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 300, height: 50))
                Spacer()
            } else {
                VStack (alignment: .leading, content: {
                    Text("Getting Started")
                        .font(.system(size: 25, weight: .bold))
                    Text("Let's jump in")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                    
                    ProgressBar(progress: progress)
                    Spacer()
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
                    Text("Password must have: 2 Numbers, 2 Capitals and 1 Special Character")
                        .font(.subheadline)
                        .fontWeight(.light)
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
                        }.padding(.top)
                        Spacer()
                    }
                })
                    .frame(width: 500, height: 500)
                    .padding()
            }
            Spacer()
            BottomToolbarView()
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
    let specials = "!@#$%^&*()_-+={[}]|:;<,>'.?/~`"
    let capitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let lowercase = "abcdefghijklmnopqrstuvwxyz"
    let numbers = "1234567890"
    var isValid = true
    var count = 0
    if Password != Password1 {
        isValid = false
    }
    if Password.count < 10 {
        isValid = false
    }
    for letter in Password {
        if specials.contains(letter) {
            count += 1
        }
    }
    if count < 1 {
        isValid = false
    }
    count = 0
    for letter in Password {
        if numbers.contains(letter) {
            count += 1
        }
    }
    if count < 2 {
        isValid = false
    }
    count = 0
    for letter in Password {
        if capitals.contains(letter) {
            count += 1
        }
    }
    if count < 2 {
        isValid = false
    }
    count = 0
    for letter in Password {
        if lowercase.contains(letter) {
            count += 1
        }
    }
    if count < 2 {
        isValid = false
    }
    return isValid
    }

}

struct BottomToolbarView: View {
    
    @EnvironmentObject private var appState: AppState
    @State var progress: Int = 0
    @State private var overText: Bool = false
    @State private var overText1: Bool = false
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        HStack {
            if progress < 1 {
                Spacer()
                Text(" Terms of Service")
                    .onHover(perform: { over in
                        overText1 = over
                    })
                    .foregroundStyle(overText1 ? .blue : .primary)
                    .onTapGesture { openWindow(id: "ToS") }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 2, height: 15)
                    .foregroundStyle(.gray)
                Text("Have an account?")
                    .onHover(perform: { over in
                        overText = over
                    })
                    .foregroundStyle(overText ? .blue : .primary)
                    .onTapGesture { appState.clear(.LogInView) }
                Spacer()
            } else {
                Text(" Terms of Service")
                    .onHover(perform: { over in overText1 = over })
                    .foregroundStyle(overText1 ? .blue : .primary)
                    .onTapGesture { openWindow(id: "ToS") }
            }
        }.padding()
    }
}

struct PasswordRestoreSaveView: View {
    
    @State var progress: Int
    
    var body: some View {
        ProgressBar(progress: progress)
    }
}

#Preview {
    RegistrationView()
}

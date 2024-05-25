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
    @State private var nickname: String = ""
    @State var secureField: Bool = true
    @State private var isOn: Bool = false
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                // Title Bar
                Text("Ecrypt")
                    .font(.system(size: 25, weight: .medium, design: Font.Design.serif))
                
                Spacer()
                
                Image("Icon_full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }.padding(.horizontal)
            
            Spacer()
            
            // User Sign up Form
            if progress >= 3 {
                // Welcome screen before user enters application but form details aren't submitted until user presses continue
                ProgressBar(progress: progress)
                
                Spacer()
                
                Text("Welcome to Ecrypt")
                    .font(.system(size: 50, weight: .medium, design: Font.Design.serif))
                
                Spacer()
                
                // Continue Button
                Button(action: {
                    
                    generateUser()  // save user info
                    appState.clear(.MainView) // Transfer to main view
                    
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
                
                
            } else if progress == 2 {
                // User to assign themself a nickname
                
                ProgressBar(progress: progress)
                
                Spacer()
                
                Text ("Please give us a nickname to call you!")
                    .font(.system(size: 25, weight: .medium, design: Font.Design.serif))
                
                Spacer()
                
                // Text field for user to input their username
                inputView(text: $nickname, placeholder: "Required", title: "Enter a Nickname", imageName: "person").onSubmit {
                    if nickname.isEmpty == false {
                        progress = 3
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // Back Button
                    Button(action: {
                            progress = 1
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.backward")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("Back")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                    }).buttonStyle(.borderless)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 200, height: 50))
                    
                    // Continue Button
                    Button(action: {
                        if nickname.isEmpty == false {
                            progress = 3
                        }
                    }, label: {
                        HStack {
                            Spacer()
                            
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
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 200, height: 50))
                    
                    Spacer()
                }
            } else if progress == 1 {
                // Does user consent to use of biometrics??
                ProgressBar(progress: progress)
                
                Spacer()
                
                VStack {
                    Text("Do you consent to using Biometrics to sign in?")
                        .font(.system(size: 25, weight: .medium, design: Font.Design.serif))
                    Image(systemName: "touchid")
                        .font(.system(size: 60))
                        .fontWeight(.semibold)
                        .foregroundStyle(.red)
                        .padding()
                    Toggle(isOn: $isSelected, label: {
                        Text("  I agree to use Biometrics to sign in")
                    }).padding()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // Back Button
                    Button(action: {
                            progress = 0
                    }, label: {
                        HStack {
                            Image(systemName: "arrow.backward")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Spacer()
                            Text("Back")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                    }).buttonStyle(.borderless)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 200, height: 50))
                    
                    // Continue Button
                    Button(action: {
                            progress = 2
                    }, label: {
                        HStack {
                            Spacer()
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
                        .frame(width: 200, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue).frame(width: 200, height: 50))
                    
                    Spacer()
                }
                Spacer()
            } else {
                // Create a password for the user :D
                VStack (alignment: .leading, content: {
                    Text("Getting Started")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text("Let's jump in")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                    
                    ProgressBar(progress: progress)
                    
                    Spacer()
                    
                    HStack {
                        // Password Field 1
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
                        
                        // apprears is password meets requirements
                        Image(systemName: "checkmark")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(passwordTesting(password) && !password.isEmpty ? .green : .clear)
                            .padding(.top, 9)
                        
                    }.padding(.top, 10)
                    
                    // Password strength Indicator
                    HStack {
                        Text("Weak")
                        
                        ZStack (alignment: .leading) {
                            // Background rectangle to show rough percentage of strength
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: 300, height: 10)
                                .foregroundStyle(Color(NSColor(white: 0.4, alpha: 0.2)))
                            
                            // Foreground rectange to show where the strength of psw lays compaired to standards
                            RoundedRectangle(cornerRadius: 25.0)
                                .frame(width: CGFloat(passwordStrength(password)*60), height: 10)
                                .foregroundStyle(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                        }
                        Text("Strong")
                    }
                    // Password requirements
                    Text("Password must have: 2 Numbers, 2 Capitals and 1 Special Character")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Text("Password must be at least 10 characters")
                        .font(.subheadline)
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    HStack {
                        // Second password input field
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
                        
                        // To show if passwords match
                        Image(systemName: "checkmark")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(password == password1 && !password1.isEmpty ? .green : .clear)
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
                                if passwordTesting(password) && password == password1 && isOn {
                                    progress = 1
                                }
                            }, label: {
                                HStack {
                                    Spacer(minLength: 87.5)
                                    Text("Continue")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(passwordTesting(password) && password == password1 && isOn ? .white : .gray)
                                    Spacer()
                                    Image(systemName: "arrow.forward")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundStyle(passwordTesting(password) && password == password1 && isOn ? .white : .clear)
                                }
                            }).buttonStyle(.borderless)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(passwordTesting(password) && password == password1 && isOn ? .blue : .clear).stroke(passwordTesting(password) && password == password1 && isOn ? .blue : .gray, lineWidth: 3).frame(width: 300, height: 50))
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

    private func passwordTesting (_ Password: String) -> Bool {
    let specials = "!@#$%^&*()_-+={[}]|:;<,>'.?/~`"
    let capitals = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let lowercase = "abcdefghijklmnopqrstuvwxyz"
    let numbers = "1234567890"
    var isValid = true
    var count = 0
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
    
    private func generateUser() {
        let user = User(psword: password, nckname: nickname, isBioAuthed: isSelected)
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
                Text("Terms of Service")
                    .onHover(perform: { over in
                        overText1 = over
                    })
                    .foregroundStyle(overText1 ? .blue : .primary)
                    .onTapGesture { NSWorkspace.shared.open(URL(string: "https://github.com/NorthDevCo/Ecrypt/blob/984b0cf47a79502c9e1db3bde1c658503a292bfc/Ecrypt%20Terms%20of%20Service.pdf")!) }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 2, height: 15)
                    .foregroundStyle(.gray)
                Text("Have an account?")
                    .onHover(perform: { over in
                        overText = over
                    })
                    .foregroundStyle(overText ? .blue : .primary)
                    .onTapGesture { appState.clear(.LogInView) }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 2, height: 15)
                    .foregroundStyle(.gray)
                Text("Help")
                    .foregroundStyle(overText ? .blue : .primary)
                    .onTapGesture { NSWorkspace.shared.open(URL(string: "https://github.com/NorthDevCo/Ecrypt/blob/8edc87ea9689f0b2f31ffed8636a116f6f11fc73/HELP.pdf")!) }
                Spacer()
            } else {
                Spacer()
                Text("Terms of Service")
                    .onHover(perform: { over in
                        overText1 = over
                    })
                    .foregroundStyle(overText1 ? .blue : .primary)
                    .onTapGesture { NSWorkspace.shared.open(URL(string: "https://github.com/NorthDevCo/Ecrypt/blob/984b0cf47a79502c9e1db3bde1c658503a292bfc/Ecrypt%20Terms%20of%20Service.pdf")!) }
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 2, height: 15)
                    .foregroundStyle(.gray)
                Text("Help")
                    .foregroundStyle(overText ? .blue : .primary)
                    .onHover(perform: { over in
                        overText = over
                    })
                    .onTapGesture { NSWorkspace.shared.open(URL(string: "https://github.com/NorthDevCo/Ecrypt/blob/8edc87ea9689f0b2f31ffed8636a116f6f11fc73/HELP.pdf")!) }
                Spacer()
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


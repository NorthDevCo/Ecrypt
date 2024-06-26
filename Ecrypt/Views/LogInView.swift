//
//  LogInView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 19/4/2024.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject private var appState: AppState
    @State private var password = ""
    @State private var overButton: Bool = false
    @State private var overText: Bool = false
    @State private var overText1: Bool = false
    @State private var overText2: Bool = false
    @State var isMatchingUUID: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image("Icon_full")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(minWidth: 150, maxWidth: 200)
                    
                VStack {
                    Text("Ecrypt")
                        .font(.system(size: 35, weight: .bold, design: Font.Design.serif))
                        
                    VStack (alignment: .leading){
                                
                        ZStack (alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 2)
                                .frame(width: 400, height: 40)
                                    
                            HStack {
                                SecureField("Enter your password", text: $password)
                                    .padding(5)
                                    .padding(.horizontal, 5)
                                    .font(.system(size: 20))
                                    .textFieldStyle(.plain)
                                    .onChange(of: password) {
                                        password = characterFilter(Password: password)
                                    }
                                    .onSubmit {
                                        passwordAuthenticate(password, appState: appState)
                                    }
                                        
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 2, height: 30)
                                    .foregroundStyle(.gray)
                                        
                                if password.isEmpty && isDeviceSupportedforAuth() {
                                    Button(action: {
                                        touchIDAuthenticate(appState: appState)
                                    }, label: {
                                        Image(systemName: "touchid")
                                            .foregroundStyle(.red)
                                            .font(.system(size: 25, weight: .bold))
                                            .background(RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 40, height: 35)
                                                .foregroundStyle(overButton ? .gray .opacity(0.3) : .clear))
                                            .onHover(perform: { over in
                                                overButton = over
                                            })
                                    }).buttonStyle(.borderless)
                                    .padding(.trailing, 10)
                                } else {
                                    Button(action: {
                                        passwordAuthenticate(password, appState: appState)
                                    }, label: {
                                        Image(systemName: "arrow.forward")
                                            .foregroundStyle(.blue)
                                            .font(.system(size: 25, weight: .bold))
                                            .background(RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 40, height: 35)
                                                .foregroundStyle(overButton ? .gray .opacity(0.3) : .clear))
                                            .onHover(perform: { over in
                                                overButton = over
                                            })
                                    }).buttonStyle(.borderless)
                                        .padding(.leading, 2.5)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        Spacer()
///                        Button(action: {
   ///      not implemented               appState.push(.RegistrationView)
      ///      yet    :(                }, label: {
         ///   I Sad Liam                  HStack (alignment: .center) {
            ///                    Text("Forgot password?")
               ///                     .onHover(perform: { over in
                  ///                      overText = over
                     ///               })
                        ///            .foregroundStyle(.blue)
                           ///         .font(.system(size: 12, weight: overText ? .bold : .regular))
                            ///}
                        ///})
                        ///.buttonStyle(.borderless)
                    }.frame(width: 400, height: 60)
                    HStack {
                        Spacer()
                        Text("   Terms of Service")
                            .onHover(perform: { over in
                                overText1 = over
                            })
                            .foregroundStyle(overText1 ? .blue : .primary)
                            .onTapGesture { NSWorkspace.shared.open(URL(string: "https://github.com/NorthDevCo/Ecrypt/blob/984b0cf47a79502c9e1db3bde1c658503a292bfc/Ecrypt%20Terms%20of%20Service.pdf")!) }
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 2, height: 15)
                            .foregroundStyle(.gray)
                        Text("Register an Account")
                            .onHover(perform: { over in
                                overText2 = over
                            })
                            .foregroundStyle(overText2 ? .blue : .primary)
                            .onTapGesture { appState.clear(.RegistrationView) }
                        Spacer()
                    }
                    .padding()
                }
                .padding()
            }
            .padding()
        }.padding()
    }
}

private func characterFilter(Password: String) -> String {
    var password = Password
    let passwordRegEx: Set<Character> = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","!","@","#","$","%","^","&","*","(",")","-","_","+","=",",",".","<",">","?","/","'",":",";","{","[","]","}","|","1","2","3","4","5","6","7","8","9","0","`","~"]
    password = password.filter( passwordRegEx.contains(_:))
    return password
}

#Preview {
    LogInView()
}

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
                        .font(.largeTitle)
                        
                    VStack (alignment: .leading){
                        Text("Password")
                            .fontWeight(.semibold)
                            .font(.footnote)
                                
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
                                        
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 2, height: 30)
                                    .foregroundStyle(.gray)
                                        
                                if password.isEmpty {
                                    Button(action: {
                                        appState.push(.MainView)
                                    }, label: {
                                        Image(systemName: "touchid")
                                            .foregroundStyle(.red)
                                            .font(.system(size: 25, weight: .bold))
                                    }).buttonStyle(.borderless)
                                    .padding(.trailing, 10)
                                } else {
                                    Button(action: {
                                        appState.push(.MainView)
                                    }, label: {
                                        Image(systemName: "arrow.forward")
                                            .foregroundStyle(.blue)
                                            .font(.system(size: 25, weight: .bold))
                                    }).buttonStyle(.borderless)
                                        .padding(.leading, 2.5)
                                        .padding(.trailing, 10)
                                }
                            }
                        }
                        Spacer()
                        Button(action: {
                            appState.push(.RegistrationView)
                        }, label: {
                            HStack (alignment: .center) {
                                Text("Forgot password?")
                                    .foregroundStyle(.blue)
                                    .font(.system(size: 12, weight: .bold))
                            }
                        })
                        .buttonStyle(.borderless)
                    }.frame(width: 400, height: 60)
                    .padding()
                }
                .padding()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    LogInView()
}

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
                                        appState.push(.MainView)
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
                        Button(action: {
                            appState.push(.RegistrationView)
                        }, label: {
                            HStack (alignment: .center) {
                                Text("Forgot password?")
                                    .onHover(perform: { over in
                                        overText = over
                                    })
                                    .foregroundStyle(.blue)
                                    .font(.system(size: 12, weight: overText ? .bold : .regular))
                            }
                        })
                        .buttonStyle(.borderless)
                    }.frame(width: 400, height: 60)
                        .padding(.bottom)
                }
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    LogInView()
}

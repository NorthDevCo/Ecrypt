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
                BiometricsFormView(progress: progress)
            } else {
                SignUpFormView()
                    .frame(width: 500, height: 500)
                    .padding()
            }
            Spacer()
            BottomToolbarView()
        }
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

struct BiometricsFormView: View {
    
    @State var progress: Int
    
    var body: some View {
        ProgressBar(progress: progress)
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

//
//  RegistrationView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 19/4/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject private var appState: AppState
    @State private var password: String = ""
    @State var progress: Int = 0
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                HStack {
                    Text("Ecrypt")
                        .font(.system(size: 25, weight: .medium, design: Font.Design.serif))
                    
                    Spacer()
                    
                    Image("Icon_full")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                
                Spacer()
                
                VStack (alignment: .leading){
                    Text("Let's jump in")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                    
                    Text("Getting Started")
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 2)
                    
                    Spacer()
                    
                    ProgressBar(progress: progress)
                    
                }
                .padding()
            }
            
        }
        .padding()
    }
}

#Preview {
    RegistrationView()
}

//
//  HomeView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/5/2024.
//

import SwiftUI

struct HomeView: View {
    
    let nickname: String = retrieveNickname()
    let wave: Data = ("👋").data(using: .utf8)!
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("\(String(data: wave, encoding: .utf8)!) Welcome to Ecrypt \(nickname)!")
                    .font(.system(size: 30, design: .serif))
                Spacer()
            }.padding(.vertical)
            
            HStack {
                Text("Recent files")
                Spacer()
            }
            
            Spacer()
        }.padding()
    }
}

#Preview {
    HomeView()
}

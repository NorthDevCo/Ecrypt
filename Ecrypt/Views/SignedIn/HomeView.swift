//
//  HomeView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/5/2024.
//

import SwiftUI

struct HomeView: View {
    
    let nickname: String = retrieveNickname()
    
    var body: some View {
        VStack {
            HStack {
                Text("Welcome \(nickname)")
            }
            HStack {
                
            }
        }
    }
}

#Preview {
    HomeView()
}

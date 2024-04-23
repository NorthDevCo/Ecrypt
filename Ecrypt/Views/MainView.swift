//
//  MainView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 23/4/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        Button(action: {
            appState.pop()
        }, label: {
            Text("Back")
        })
    }
}

#Preview {
    MainView()
}

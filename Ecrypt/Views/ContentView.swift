//
//  ContentView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 23/4/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationStack {
            
            if let currentRoute = appState.currentRoute {
                switch currentRoute {
                case .MainView:
                    MainView()
                case .LogInView:
                    LogInView()
                case .RegistrationView:
                    RegistrationView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

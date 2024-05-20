//
//  AppState.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 23/4/2024.
//

import Foundation

enum Route {
    case MainView
    case LogInView
    case RegistrationView
    case ForgotPasswordView
}

class AppState: ObservableObject {
    
    @Published var routes: [Route]
    
    init() {
        if FileManager.default.fileExists(atPath: FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt/U-001.EcSUF").path()) {
            self.routes = [.LogInView]
        } else {
            self.routes = [.RegistrationView]
        }
    }
    
    var currentRoute: Route? {
        routes.last
    }
    
    func push (_ route: Route) {
        routes.append(route)
    }
    
    func clear (_ route: Route) {
        routes = [route]
    }
    
    @discardableResult
    func pop () -> Route? {
        routes.popLast()
    }
    
}

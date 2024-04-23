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
    
    @Published var routes: [Route] = [.LogInView]
    
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

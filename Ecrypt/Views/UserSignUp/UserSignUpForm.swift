//
//  UserSignUpForm.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 25/4/2024.
//

import SwiftUI

struct UserSignUpForm: View {
    
    @State var progress: Int = 0
    
    var body: some View {
        if progress == 0 {
            Text("password")
        } else if progress == 1 {
            Text("biometrics")
        } else if progress == 2 {
            Text("forgot password")
        } else {
            Text("completed welcome")
        }
    }
}

#Preview {
    UserSignUpForm()
}

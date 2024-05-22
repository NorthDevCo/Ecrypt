//
//  FilesView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/5/2024.
//

import SwiftUI

struct FilesView: View {
    
    @State var filesList: [String]
    let nickname: String = retrieveNickname()
    let wave: Data = ("👋").data(using: .utf8)!
    
    var body: some View {
        VStack {
            HStack {
                Text("\(String(data: wave, encoding: .utf8)!) Welcome to Ecrypt \(nickname)!")
                    .font(.system(size: 30, design: .serif))
                Spacer()
            }.padding(.bottom)
            
            ScrollView {
                // fis this tomorrow
            }.padding()
        }
    }
}

#Preview {
    FilesView(filesList: [""])
}

//
//  FilesView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 20/5/2024.
//

import SwiftUI

struct FilesView: View {
    
    @State var filePaths: URL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "Files")
    @State var filesList: [String] = try! String(contentsOf: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "B-MC2.txt")).components(separatedBy: "|")
    @State var num: String = ""
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
                ForEach(0..<filesList.count) { word in
                    FileView(filePath: filePaths.appending(path: filesList[word]), fileName: filesList[word]).onAppear(perform: {
                    })
                }
            }.padding()
        }
    }
}

#Preview {
    FilesView(filePaths: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt"), filesList: [""])
}

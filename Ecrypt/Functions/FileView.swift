//
//  FileView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 22/5/2024.
//

import SwiftUI

struct FileView: View {
    
    @EnvironmentObject private var appState: AppState
    @State var filePath: URL
    @State var fileName: String
    @State var isOver: Bool = false
    @State var isOver2: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "doc.text").font(.title3).padding()
            
            Text("\(fileName)")
            
            Spacer()
            
            Button(action: {
                FileDownloader(file: fileName, SavePath: filePath)
            }, label: {
                Image(systemName: "tray.and.arrow.down.fill")
                    .font(.title3)
                    .foregroundStyle(isOver ? .blue : .primary)
            }).buttonStyle(.borderless)
                .onHover(perform: { over in
                    isOver = over
                })
            
            Button(action: {
                FileDeleter(file: fileName, appState: appState)
            }, label: {
                Image(systemName: "trash")
                    .font(.title3)
                    .foregroundStyle(isOver2 ? .red : .primary)
            }).buttonStyle(.borderless)
                .padding()
                .onHover(perform: { over in
                    isOver2 = over
                })
            
        }
    }
}

#Preview {
    FileView(filePath: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt"), fileName: "U-001.txt")
}

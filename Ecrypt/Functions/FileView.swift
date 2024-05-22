//
//  FileView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 22/5/2024.
//

import SwiftUI

struct FileView: View {
    
    @State var filePath: String
    @State var fileName: String
    @State var isOver: Bool = false
    @State var isOver2: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "doc.text").font(.title3).padding()
            
            Text("\(fileName)")
            
            Spacer()
            
            Button(action: {
                FileDownloader()
            }, label: {
                Image(systemName: "tray.and.arrow.down.fill")
                    .font(.title3)
                    .foregroundStyle(isOver ? .blue : .primary)
            }).buttonStyle(.borderless)
                .onHover(perform: { over in
                    isOver = over
                })
            
            Button(action: {
                FileDownloader()
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
    FileView(filePath: "gay", fileName: "U-001.txt")
}

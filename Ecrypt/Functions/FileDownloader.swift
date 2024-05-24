//
//  FileDownloader.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 22/5/2024.
//

import Foundation
import SwiftUI

func FileDownloader (file: String, SavePath: URL) {
    try? FileManager.default.copyItem(at: SavePath, to: FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true))
}

func FileDeleter (file: String, appState: AppState) {
    DispatchQueue.main.async {
        appState.clear(.MainView)
        try! FileManager.default.removeItem(atPath: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: "Files").appending(path: file).path())
    }
}

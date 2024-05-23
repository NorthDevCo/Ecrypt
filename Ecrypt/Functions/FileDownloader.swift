//
//  FileDownloader.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 22/5/2024.
//

import Foundation
import SwiftUI

func FileDownloader (file: String, SavePath: URL) {
    let temp = try! String(contentsOf: SavePath.appending(path: file))
    try! FileManager.default.createFile(atPath: String(from: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask) as! Decoder), contents: temp.data(using: .utf8))
}

func FileDeleter (file: String) {
    try! FileManager.default.removeItem(atPath: FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!.appending(path:"Ecrypt").appending(path: file).path())
}



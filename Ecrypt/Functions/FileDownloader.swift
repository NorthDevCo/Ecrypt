//
//  FileDownloader.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 22/5/2024.
//

import Foundation

func FileDownloader (file: String, SavePath: URL) {
    var temp = try! String(contentsOf: SavePath.appending(path: file))
    var temp1
}

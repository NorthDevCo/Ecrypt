//
//  ProgressBar.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 25/4/2024.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var progress: Int = 0
    
    var body: some View {
        ZStack {
            HStack {
                Spacer(minLength: 20)
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 240, height: 4)
                    .foregroundStyle(progress >= 1 ? .green : .gray)
                Spacer(minLength: 30)
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 240, height: 4)
                    .foregroundStyle(progress >= 2 ? .green : .gray)
                Spacer(minLength: 30)
            }
            
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 30, alignment: .center)
                        .foregroundStyle(progress >= 1 ? .green : .clear)
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: 30, alignment: .center)
                        .foregroundStyle(progress >= 0 ? .green : .gray)
                        .overlay(alignment: .center) {
                            if progress >= 1 {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                            } else {
                                Text("1")
                                    .font(.title)
                            }
                        }
                }
                Spacer()
                
                ZStack {
                    Circle()
                        .frame(width: 30, alignment: .center)
                        .foregroundStyle(progress >= 2 ? .green : .clear)
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: 30, alignment: .center)
                        .foregroundStyle(progress >= 1 ? .green : .gray)
                        .overlay(alignment: .center) {
                            if progress >= 2 {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                            } else {
                                Text("2")
                                    .font(.title)
                            }
                        }
                }
                Spacer()
                
                ZStack {
                    Circle()
                        .frame(width: 30, alignment: .center)
                        .foregroundStyle(progress >= 3 ? .green : .clear)
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: 30, alignment: .center)
                        .foregroundStyle(progress >= 2 ? .green : .gray)
                        .overlay(alignment: .center) {
                            if progress >= 3 {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .fontWeight(.bold)
                            } else {
                                Text("3")
                                    .font(.title)
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    ProgressBar(progress: 0)
}

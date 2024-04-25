//
//  ProgressBar.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 25/4/2024.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var progress: Int
    
    var body: some View {
        ZStack {
            HStack {
                Spacer(minLength: 30)
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 200, height: 3)
                    .foregroundStyle(progress >= 1 ? .green : .gray)
                Spacer(minLength: 40)
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 200, height: 3)
                    .foregroundStyle(progress >= 2 ? .green : .gray)
                Spacer(minLength: 30)
            }
            
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 20, alignment: .center)
                        .foregroundStyle(progress >= 1 ? .green : .clear)
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 20, alignment: .center)
                        .foregroundStyle(progress >= 0 ? .green : .gray)
                        .overlay(alignment: .center) {
                            if progress >= 1 {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            } else {
                                Text("1")
                                    .font(.title3)
                            }
                        }
                }
                Spacer()
                
                ZStack {
                    Circle()
                        .frame(width: 20, alignment: .center)
                        .foregroundStyle(progress >= 2 ? .green : .clear)
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 20, alignment: .center)
                        .foregroundStyle(progress >= 1 ? .green : .gray)
                        .overlay(alignment: .center) {
                            if progress >= 2 {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            } else {
                                Text("2")
                                    .font(.title3)
                            }
                        }
                }
                Spacer()
                
                ZStack {
                    Circle()
                        .frame(width: 20, alignment: .center)
                        .foregroundStyle(progress >= 3 ? .green : .clear)
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 20, alignment: .center)
                        .foregroundStyle(progress >= 2 ? .green : .gray)
                        .overlay(alignment: .center) {
                            if progress >= 3 {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                            } else {
                                Text("3")
                                    .font(.title3)
                            }
                        }
                }
            }
        }
        .frame(width: 500)
    }
}

#Preview {
    ProgressBar(progress: 1)
}

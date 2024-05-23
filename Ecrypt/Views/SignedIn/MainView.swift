//
//  MainView.swift
//  Ecrypt
//
//  Created by Liam Fletcher on 23/4/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var appState: AppState
    @Environment(\.colorScheme) var colourScheme
    @Namespace private var animation
    @State var selectedTab: Int = 2
    @State var isExpanded: Bool = false
    @State var isOver: Bool = false
    @State var isOver1: Bool = false
    @State var isOver2: Bool = false
    @State var isOver3: Bool = false
    @State var isOver4: Bool = false
    @State var nickname: String = retrieveNickname()
    
    var body: some View {
        HStack {
            VStack {
                if isExpanded {
                    VStack {
                        Image("Icon_full")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                            .matchedGeometryEffect(id: "logo", in: animation)
                        VStack (alignment: .leading) {
                            
//                            HStack {
//                                Image(systemName: isOver ? "house.fill" : "house")
//                                    .font(.system(size: 18))
  //                                  .foregroundStyle(isOver ? .yellow : .primary)
  //                              Image(colourScheme == .dark ? "1.light" : "1")
    //                                .resizable()
      //                              .scaledToFit()
      //                              .frame(width: 35)
//
  //                          }.padding(.vertical,5)
    //                            .matchedGeometryEffect(id: "house", in: animation)
      //                          .onTapGesture {
        //                            selectedTab = 1
          //                      }
            //                    .onHover(perform: { over in
              //                      isOver = over
                //                })
                            
                            HStack {
                                Image(systemName: isOver2 ? "folder.fill" : "folder")
                                    .font(.system(size: 18))
                                    .padding(.horizontal, 1)
                                    .foregroundStyle(isOver2 ? .blue : .primary)
                                Image(colourScheme == .dark ? "2.light" : "2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                            }.padding(.vertical,5)
                                .matchedGeometryEffect(id: "folder", in: animation)
                                .onTapGesture {
                                    selectedTab = 2
                                }
                                .onHover(perform: { over in
                                    isOver2 = over
                                })
                            
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: isOver4 ? "gearshape.fill" : "gearshape")
                                    .font(.system(size: 18))
                                Image(colourScheme == .dark ? "3.light" : "3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)

                            }.padding(.vertical,5)
                                .matchedGeometryEffect(id: "gear", in: animation)
                                .onTapGesture {
                                    selectedTab = 4
                                }
                                .onHover(perform: { over in
                                    isOver4 = over
                                })
                            
                            HStack {
                                Image(systemName: isOver1 ? "lock.fill" : "lock")
                                    .font(.system(size: 18))
                                    .foregroundStyle(isOver1 ? .red : .primary)
                                    .padding(.horizontal, 1.8)
                                Image(colourScheme == .dark ? "4.light" : "4")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                            }.padding(.vertical,5)
                                .matchedGeometryEffect(id: "lock", in: animation)
                                .onTapGesture {
                                    appState.clear(.LogInView)
                                }
                                .onHover(perform: { over in
                                    isOver1 = over
                                })
                            
                        }.padding(.horizontal)
                            .padding(.bottom)
                    }
                } else {
                    VStack {
                        Image("Icon_full")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                            .matchedGeometryEffect(id: "logo", in: animation)
                        
//                        Image(systemName: selectedTab == 1 ? "house.fill" : "house")
  //                          .font(.system(size: 18))
    //                        .foregroundStyle(selectedTab == 1 ? .yellow : .primary)
      //                      .padding(.bottom,5)
        //                    .matchedGeometryEffect(id: "house", in: animation)
          //                  .onTapGesture {
            //                    selectedTab = 1
              //              }
                //            .onHover(perform: { over in
                  //              isOver = over
                    //        })

                        Image(systemName: selectedTab == 2 ? "folder.fill" : "folder")
                            .font(.system(size: 18))
                            .padding(.horizontal, 1)
                            .foregroundStyle(selectedTab == 2 ? .blue : .primary)
                            .padding(.vertical,5)
                            .matchedGeometryEffect(id: "folder", in: animation)
                            .onTapGesture {
                                selectedTab = 2
                            }
                            .onHover(perform: { over in
                                isOver2 = over
                            })
                            
                                                    
                            Spacer()
                            
                        Image(systemName:  selectedTab == 4 ? "gearshape.fill" : "gearshape")
                            .font(.system(size: 18))
                            .padding(.vertical,5)
                            .matchedGeometryEffect(id: "gear", in: animation)
                            .onTapGesture {
                                selectedTab = 4
                            }
                            .onHover(perform: { over in
                                isOver4 = over
                            })
                        
                        Image(systemName: isOver1 ? "lock.fill" : "lock")
                            .font(.system(size: 18))
                            .foregroundStyle(isOver1 ? .red : .primary)
                            .padding(.horizontal, 1.8)
                            .matchedGeometryEffect(id: "lock", in: animation)
                            .padding(.vertical,5)
                            .onTapGesture {
                                appState.clear(.LogInView)
                            }
                            .onHover(perform: { over in
                                isOver1 = over
                            })
                    }.padding(.bottom)
                }
            }.onHover(perform: { over in
                withAnimation {
                    isExpanded.toggle()
                }
            })
            Spacer()
            if selectedTab == 1 {
                HomeView()
            } else if selectedTab == 2 {
                FilesView()
            } else {
                SettingsView(nickname: "pp", isOn: true)
            }
            Spacer()
        }
    }
}

#Preview {
    MainView()
}




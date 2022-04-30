//
//  ContentView.swift
//  SwiftUISideMenuDemo
//
//  Created by Rupesh Chaudhari on 24/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isSideBarOpened = false
    
    var body: some View {
        ZStack {
            NavigationView {
                GeometryReader { dimensions in
                    List {
                        ForEach(0..<8) { _ in
                            AsyncImage(url: URL(string: "https://picsum.photos/600")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 240)
                            } placeholder: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray.opacity(0.6))
                                        .frame(height: 240)
                                    ProgressView()
                                }
                            }
                            .aspectRatio(3 / 2, contentMode: .fill)
                            .cornerRadius(12)
                            .padding(.vertical)
                            .shadow(radius: 4)
                        }
                    }
                    .toolbar {
                        Button(role: ButtonRole.destructive) {
                            isSideBarOpened.toggle()
                        } label: {
                            Label("Toggle SideBar", systemImage: "line.3.horizontal.circle.fill")
                        }
                    }
                    .listStyle(.inset)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            SideMenu(isSidebarVisible: $isSideBarOpened)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

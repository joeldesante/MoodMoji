//
//  ContentView.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            TimelineView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Entries")
                }
            LogView()
                .tabItem {
                    Image(systemName: "pencil.line")
                    Text("Log")
                }
        }
        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

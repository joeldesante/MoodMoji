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
            EntriesView()
                .tabItem {
                    Image(systemName: "1.circle.fill")
                    Text("Entries")
                }
            LogView()
                .tabItem {
                    Image(systemName: "2.square.fill")
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

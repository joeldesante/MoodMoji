//
//  ContentView.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timeline: Timeline = Timeline();
    
    var body: some View {
        TabView {
            TimelineView(timeline: timeline)
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Entries")
                }
            LogView(timeline: timeline)
                .tabItem {
                    Image(systemName: "pencil.circle.fill")
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

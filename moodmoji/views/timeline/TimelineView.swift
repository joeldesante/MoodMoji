//
//  EntriesView.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct TimelineView: View {
    
    @ObservedObject var timeline: Timeline;
        
    var body: some View {
        ScrollView {
            VStack {
                Text("Logs")
                    .font(.title)
                ForEach(timeline.logs) { log in
                    Entry(emotions: log.emotions, notes: log.notes, date: log.date)
                }
            }
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    
    @StateObject var timeline: Timeline = Timeline();
    
    static var previews: some View {
        TimelineView(timeline: Timeline())
    }
}

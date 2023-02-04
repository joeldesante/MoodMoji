//
//  LogView.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct LogView: View {
    
    @ObservedObject var timeline: Timeline;
    @State private var additionalNotes: String = "";
    @State private var selectedEmotions = Set<String>();
    @State private var currentDate = Date()
    
    var body: some View {
        ScrollView {
            
            VStack {
                Text("How do you feel right now?")
                    .font(.title)
                    .padding();
                MoodGrid(selectedEmotions: $selectedEmotions)
            }
            
            Divider()
            
            VStack {
                Text("Additional Notes")
                    .font(.title)
                
                TextField("What's on your mind?", text: $additionalNotes)
                
            }.padding()
            Divider()
            
            VStack {
                DatePicker("", selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                Button("Log") {
                    
                    let log = Log(
                        id: UUID(),
                        emotions: selectedEmotions.joined(separator: ", "),
                        notes: additionalNotes,
                        date: currentDate
                    )
                    
                    timeline.createLog(log: log);
                    
                    // Reset
                    selectedEmotions = Set<String>();
                    additionalNotes = "";
                    currentDate = Date() 
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(timeline: Timeline())
    }
}

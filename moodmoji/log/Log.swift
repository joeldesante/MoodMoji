//
//  Log.swift
//  moodmoji
//
//  Created by Joel DeSante on 2/3/23.
//

import Foundation

struct Log: Identifiable {
    let id: UUID;
    let emotions: String;
    let notes: String;
    let date: Date;
    
    init(id: UUID, emotions: String, notes: String, date: Date) {
        self.id = id
        self.emotions = emotions
        self.notes = notes
        self.date = date
    }
    
    func getString() -> String {
        let output = "\(self.date.formatted())\n\(self.emotions)\n\(self.notes)\n";
        return output;
    }
}

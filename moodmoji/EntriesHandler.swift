//
//  Entries.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import Foundation

struct EntryLog: Identifiable {
    let id: UUID;
    let emotions: String;
    let notes: String;
    let date: Date;
    
    init(id: UUID = UUID(), emotions: String, notes: String, date: Date) {
        self.id = id;
        self.emotions = emotions;
        self.notes = notes;
        self.date = date;
    }
}

class EntriesHandler {
    
    private static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    static func getEntries() -> [EntryLog] {
        
        var entries: [EntryLog] = [];
        
        let directoryContents = try! FileManager.default.contentsOfDirectory(
            at: getDocumentsDirectory(),
            includingPropertiesForKeys: nil
        )
        
        let sortedEntries = directoryContents.sorted {
            Double($0.lastPathComponent)! > Double($1.lastPathComponent)!
        }
        
        for url in sortedEntries {
            let contents = try! String(contentsOf: url);
            let contentsPart = contents.split(whereSeparator: \.isNewline);
            let date = Date(timeIntervalSince1970: Double(url.lastPathComponent)!)
            
            entries.append(
                EntryLog(
                    emotions: String(contentsPart.first!),
                    notes: String(contentsPart.last!),
                    date: date
                )
            );
        }
        
        return entries;
    }
    
    static func getEntriesAsText() -> String {
        let entries = getEntries();
        var text = "";
        for entry in entries {
            text.append("\(entry.date.formatted())\n")
            text.append("\(entry.emotions)\n")
            text.append("\(entry.notes)\n")
            text.append("---\n\n")
        }
        
        return text;
    }
    
    static func createEntry(date: Date, emotions: Set<String>, notes: String) {
        
        let logName = "\(String(date.timeIntervalSince1970))"
        let emotions = emotions.joined(separator: ", ");
        let content = "Moods: \(emotions)\nLog: \(notes)";
        let filename = getDocumentsDirectory().appendingPathComponent(logName, conformingTo: .text);
        
        do {
            try content.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            print("Created Log")
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            print("Failed to write to file system")
        }
        
    }
}

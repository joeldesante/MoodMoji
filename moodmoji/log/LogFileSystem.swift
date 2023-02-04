//
//  FilePersistable.swift
//  moodmoji
//
//  Created by Joel DeSante on 2/3/23.
//

import Foundation

class LogFileSystem: LogModel {
    
    func save(log: Log) {
        
        let logName = "\(String(log.date.timeIntervalSince1970))"
        let content = "Moods: \(log.emotions)\nLog: \(log.notes)";
        
        let filename = getDocumentsDirectory().appendingPathComponent(logName, conformingTo: .text);
        
        do {
            try content.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            print("Created Log")
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            print("Failed to write to file system")
        }
    }
    
    func loadAllLogs() -> [Log] {
        
        var logs: [Log] = [];
        let directoryContents = try! FileManager.default.contentsOfDirectory(
            at: getDocumentsDirectory(),
            includingPropertiesForKeys: nil
        )
        
        for url in directoryContents {
            let contents = try! String(contentsOf: url);
            let contentsPart = contents.split(whereSeparator: \.isNewline);
            let date = Date(timeIntervalSince1970: Double(url.lastPathComponent)!)
            
            logs.append(
                Log(
                    id: UUID(),
                    emotions: String(contentsPart.first!),
                    notes: String(contentsPart.last!),
                    date: date
                )
            );
        }
        
        return logs;
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

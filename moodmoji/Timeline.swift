//
//  Entries.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import Foundation

class Timeline {
    
    private let logModel: LogModel;
    private var logs: [Log];
    
    init() {
        self.logModel = LogFileSystem();
        self.logs = [];
        self.loadLogs();
    }
    
    func createLog(log: Log) {
        logModel.save(log: log);
        logs.append(log);
        self.logs = self.sortLogsByDate(logs: self.logs);
    }
    
    func loadLogs() {
        self.logs = self.sortLogsByDate(logs: self.logModel.loadAllLogs());
    }
    
    func getLogsAsText() -> String {
        var text = "";
        for log in logs {
            text.append("\(log.getString())---\n\n")
        }
        return text;
    }
    
    private func sortLogsByDate(logs: [Log]) -> [Log] {
        let sortedEntries = logs.sorted {
            $0.date > $1.date
        }
        
        return sortedEntries;
    }
}

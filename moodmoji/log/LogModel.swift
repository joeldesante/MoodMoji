//
//  Persistable.swift
//  moodmoji
//
//  Created by Joel DeSante on 2/3/23.
//

import Foundation

protocol LogModel {
    func save(log: Log) -> Void;
    func loadAllLogs() -> [Log];
}

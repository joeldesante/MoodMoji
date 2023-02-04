//
//  EntriesView.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct TimelineView: View {
    
    @ObservedObject var timeline: Timeline;
    @State private var showMailView = false;
    @State private var mailData = ComposeMailData(
        subject: "Mood Log",
        recipients: [""],
        message: "",
        attachments: [
            AttachmentData(
                data: "".data(using: .utf8)!,
                mimeType: "text/plain",
                fileName: "log.txt"
            )
        ]
    );
        
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button("Send Email") {
                        mailData = ComposeMailData(
                            subject: "Mood Log",
                            recipients: [""],
                            message: timeline.getLogsAsText(),
                            attachments: [
                                AttachmentData(
                                    data: timeline.getLogsAsText().data(using: .utf8)!,
                                    mimeType: "text/plain",
                                    fileName: "log.txt"
                                )
                            ]
                        );
                        showMailView.toggle();
                    }
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $showMailView) {
                      MailView(data: $mailData) { result in
                        print(result)
                      }
                    }
                    
                }
                Divider()
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
    static var previews: some View {
        TimelineView(timeline: Timeline())
    }
}

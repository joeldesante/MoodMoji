//
//  EntriesView.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct EntriesView: View {
    
    @State var entries = EntriesHandler.getEntries();
    @State private var mailData = ComposeMailData(
        subject: "Mood Log",
        recipients: [""],
        message: EntriesHandler.getEntriesAsText(),
        attachments: [AttachmentData(data: EntriesHandler.getEntriesAsText().data(using: .utf8)!,
        mimeType: "text/plain",
        fileName: "text.txt")
    ]);
    @State private var showMailView = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                      showMailView.toggle()
                    }) {
                      Text("Send mail")
                    }.disabled(!MailView.canSendMail)
                    .sheet(isPresented: $showMailView) {
                      MailView(data: $mailData) { result in
                        print(result)
                       }
                    }
                    Button("Reload") {
                        entries = EntriesHandler.getEntries();
                        mailData = ComposeMailData(
                            subject: "Mood Log",
                            recipients: [""],
                            message: EntriesHandler.getEntriesAsText(),
                            attachments: [AttachmentData(data: EntriesHandler.getEntriesAsText().data(using: .utf8)!,
                            mimeType: "text/plain",
                            fileName: "text.txt")
                        ]);
                    }
                }
                Divider()
                ForEach(entries) { entry in
                    Entry(emotions: entry.emotions, notes: entry.notes, date: entry.date)
                }
            }
        }
    }
}

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesView()
    }
}

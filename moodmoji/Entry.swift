//
//  Entry.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/30/23.
//

import SwiftUI

struct Entry: View {
    
    @State var emotions: String;
    @State var notes: String;
    @State var date: Date;
    
    var body: some View {
        VStack {
            Text(date.formatted())
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
            Text(emotions)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            Text(notes)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
        }.padding()
    }
}

struct Entry_Previews: PreviewProvider {
    static var previews: some View {
        Entry(emotions: "A, B, C", notes: "Hello", date: Date())
    }
}

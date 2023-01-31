//
//  Mood.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct Mood: View {
    
    @State var emotion: Emotion;
    
    var body: some View {
        VStack {
            Text(String(emotion.emoji))
                .font(.system(size: 52.0))
            Text(emotion.name)
                .font(.system(size: 12.0))
        }
    }
}

struct Mood_Previews: PreviewProvider {
    static var previews: some View {
        Mood(
            emotion: Emotion(
                emoji: "🤬",
                name: "Furious",
                category: EmotionsCategory.Angry
            )
        )
    }
}

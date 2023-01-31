//
//  EmotionGrid.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import SwiftUI

struct MoodGrid: View {
    
    @StateObject private var emotionList = EmotionList();
    @Binding var selectedEmotions: Set<String>;
    
    var body: some View {
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        
        LazyVGrid(
            columns: columns,
            spacing: 10
        ) {
            ForEach(emotionList.emotions) { emotion in
                Mood(emotion: emotion)
                    .frame(width: 110, height: 110)
                    .background(selectedEmotions.contains(emotion.name) ? Colors.Selection : Color.black.opacity(0.0))
                    .cornerRadius(10)
                    .onTapGesture {
                    let hasEmotion = selectedEmotions.contains(emotion.name);
                    if hasEmotion {
                        selectedEmotions.remove(emotion.name)
                        return;
                    }
                    selectedEmotions.insert(emotion.name)
                }
            }
        }
    }
}

struct MoodGrid_Previews: PreviewProvider {
    static var previews: some View {
        MoodGrid(selectedEmotions: .constant(Set<String>()));
    }
}

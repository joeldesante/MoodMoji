//
//  MoodList.swift
//  moodmoji
//
//  Created by Joel DeSante on 1/29/23.
//

import Foundation

enum EmotionsCategory: Int {
    case Happy = 0;
    case Neutral = 1;
    case Angry = 2;
    case Sad = 3;
    case Sick = 4;
    case Uneasy = 5;
}

//case Thrilled, Loved, InLove, Nauseated, Bored, Tired, Worried, Stressed, Icky, Confident, Disoriented, SelfConscious, Hurt, Lustful, Contemplative, Embarressed, Mad, Shy, Apathetic, FedUp, Sleepy, Exhausted, Furious, Frightened, Insulted, Lonely, Withdrawn, AtPeace, Confused, Irritated, Content, Flattered;

struct Emotion: Identifiable, Comparable {
    static func < (lhs: Emotion, rhs: Emotion) -> Bool {
        return lhs.category.rawValue < rhs.category.rawValue;
    }
    
    let emoji: Character;
    let name: String;
    let category: EmotionsCategory;
    var id: String { name };
}

class EmotionList: ObservableObject {
    @Published var emotions: [Emotion];
    
    internal init() {
        self.emotions = [
            Emotion(emoji: "😃", name: "Thrilled", category: EmotionsCategory.Happy),
            Emotion(emoji: "🥰", name: "Loved", category: EmotionsCategory.Happy),
            Emotion(emoji: "😍", name: "In Love", category: EmotionsCategory.Happy),
            Emotion(emoji: "🥱", name: "Bored", category: EmotionsCategory.Neutral),
            Emotion(emoji: "😖", name: "Worried", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😩", name: "Stressed", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "🤢", name: "Icky", category: EmotionsCategory.Sick),
            Emotion(emoji: "‍😵‍💫", name: "Disoriented", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "‍🫣", name: "Self Conscious", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "🥺", name: "Hurt", category: EmotionsCategory.Sad),
            Emotion(emoji: "😏", name: "Lustful", category: EmotionsCategory.Happy),
            Emotion(emoji: "🤔", name: "Contemplative", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😰", name: "Embarresed", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😡", name: "Mad", category: EmotionsCategory.Angry),
            Emotion(emoji: "🤐", name: "Shy", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😐", name: "Apathetic", category: EmotionsCategory.Neutral),
            Emotion(emoji: "😤", name: "Fed Up", category: EmotionsCategory.Angry),
            Emotion(emoji: "😴", name: "Sleepy", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😮‍💨", name: "Exhausted", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "🤬", name: "Furious", category: EmotionsCategory.Angry),
            Emotion(emoji: "😱", name: "Frightened", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😧", name: "Insulted", category: EmotionsCategory.Angry),
            Emotion(emoji: "🙁", name: "Lonely", category: EmotionsCategory.Sad),
            Emotion(emoji: "🫥", name: "Withdrawn", category: EmotionsCategory.Neutral),
            Emotion(emoji: "😌", name: "At Peace", category: EmotionsCategory.Happy),
            Emotion(emoji: "🤨", name: "Confused", category: EmotionsCategory.Uneasy),
            Emotion(emoji: "😒", name: "Irritated", category: EmotionsCategory.Angry),
            Emotion(emoji: "🙂", name: "Content", category: EmotionsCategory.Happy),
            Emotion(emoji: "😊", name: "Flattered", category: EmotionsCategory.Happy)
        ]
        
        self.emotions.sort();
    }
}

import SwiftUI
import SwiftData
import Combine




struct MoodModel: Identifiable {
    var id = UUID()
    var feeling: String
    var mood: ImageResource
    var color: Color
}

public struct Mockdata {
    var moods: [MoodModel] = [
        MoodModel(feeling: "Unhappy", mood: .unhappy, color: .cUnhappy),
        MoodModel(feeling: "Sad", mood: .sad, color: .cSad),
        MoodModel(feeling: "Normal", mood: .normal, color: .cNormal),
        MoodModel(feeling: "Good", mood: .good, color: .cGood),
        MoodModel(feeling: "Happy", mood: .happy, color: .cHappy)
    ]
}



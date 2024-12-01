import SwiftUI
import SwiftData

public class MoodTrackerViewModel: ObservableObject {
    
    static let shared = MoodTrackerViewModel()
    
    @Published var feeling = "?"
    @Published var Fcolor: Color = .white
    @Published var scrollToBottom = false
    
    @Published var selectedMood: ImageResource = .none {
        didSet {
            saveSelectedMood()
        }
    }
    
    init() {
        loadSelectedMood()
    }
    
    private func loadSelectedMood() {
        if let saveMood = UserDefaults.standard.string(forKey: "selectedMood"), let mood = ImageResource(rawValue: saveMood) {
            self.selectedMood = mood
            if let mockMood = Mockdata().moods.first(where: { $0.mood == mood}) {
                self.Fcolor = mockMood.color
                self.feeling = mockMood.feeling
            }
        }
    }
    
    private func saveSelectedMood() {
        UserDefaults.standard.set(selectedMood.rawValue, forKey: "selectedMood")
    }
}


extension MoodTrackerViewModel {
    static func getFcolorFromDefaults() -> Color {
        if let savedMood = UserDefaults.standard.string(forKey: "selectedMood"),
           let mood = ImageResource(rawValue: savedMood),
           let mockMood = Mockdata().moods.first(where: { $0.mood == mood }) {
            return mockMood.color
        }
        return .white
    }

    static func getSelectedMoodFromDefaults() -> ImageResource {
        if let savedMood = UserDefaults.standard.string(forKey: "selectedMood"),
           let mood = ImageResource(rawValue: savedMood) {
            return mood
        }
        return .none
    }
}


public enum ImageResource: String {
    case unhappy
    case sad
    case normal
    case good
    case happy
    case none
}

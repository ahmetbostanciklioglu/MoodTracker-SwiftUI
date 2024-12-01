import SwiftUI
import SwiftData

struct MoodTrackerView: View {

    @StateObject var viewModel: MoodTrackerViewModel
    
    
    init() {
        let viewModel = MoodTrackerViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var mockdata = Mockdata()

    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment: .bottomTrailing) {
                MoodTrackerBg(viewModel: viewModel)
                
                ScrollView {
                    VStack(spacing: 64) {
                        topTitle
                        IconView(Fcolor: $viewModel.Fcolor, selectedMood: $viewModel.selectedMood)
                        moodSelectionView
                        NoteView(scrollToBottom: $viewModel.scrollToBottom)
                            .id("NoteEditor")
                    }
                    .padding()
                }
            }
            .onChange(of: viewModel.scrollToBottom) { _, _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        proxy.scrollTo("NoteEditor", anchor: .bottom)
                    }
                }
            }
        }
    }

    private var moodSelectionView: some View {
        HStack(spacing: 20) {
            ForEach(mockdata.moods) { mood in
                VStack(spacing: 16) {
                    Image(mood.mood.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45, alignment: .center)
                    Text(mood.feeling)
                        .foregroundStyle(.white)
                }
                .scaleEffect(viewModel.selectedMood == mood.mood ? 1.3 : 0.8)
                .onTapGesture {
                    withAnimation {
                        viewModel.selectedMood = mood.mood
                        viewModel.Fcolor = mood.color
                        viewModel.feeling = mood.feeling
                    }
                }
            }
        }
    }
}


#Preview {
    MoodTrackerView()
}





struct MoodTrackerBg: View {
    @ObservedObject var viewModel: MoodTrackerViewModel
    var body: some View {
        Color.black.ignoresSafeArea()
        
        Circle()
            .foregroundStyle(viewModel.Fcolor)
            .frame(width: 300, height: 300)
            .blur(radius: 200)
            .offset(x: 130, y: 130)
    }
}

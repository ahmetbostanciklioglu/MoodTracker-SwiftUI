import SwiftUI

extension MoodTrackerView {
    var topTitle: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("How Do You Feel")
            HStack {
                Text("Today")
                Text(viewModel.feeling)
                    .foregroundStyle(viewModel.Fcolor)
                    .contentTransition(.numericText())
            }
        }
        .foregroundStyle(.white)
        .font(.largeTitle.bold())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

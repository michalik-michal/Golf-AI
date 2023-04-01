import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    viewModel.conversation = []
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 23)
                }
            }
            .padding(.horizontal)
            Divider()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.conversation) { conversation in
                        MessageView(model: conversation)
                    }
                    if viewModel.requestState == .inProgress {
                        Circle()
                    }
                }
            }
            HStack {
                CustomTextField(placeholderText: "Type here...", text: $text)
                    .foregroundColor(.white)
                Button {
                    viewModel.send(message: text)
                    text = ""
                } label: {
                    if !text.isEmpty {
                        Image(systemName: "paperplane")
                            .resizable()
                            .frame(width: 21, height: 21)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(Color("background"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

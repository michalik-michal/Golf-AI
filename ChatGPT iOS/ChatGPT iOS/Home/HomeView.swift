import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            headerStack
            Divider()
            messageScrollView
            textField
        }
        .background(Color("background"))
    }
    
    private var headerStack: some View {
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
    }
    
    private var messageScrollView: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(viewModel.conversation) { conversation in
                    MessageView(model: conversation)
                }
                if viewModel.requestState == .inProgress {
                    LottieView(name: "typingAnimation")
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
    
    private var textField: some View {
        HStack {
            CustomTextField(placeholderText: "Type here...", text: $text)
                .foregroundColor(.white)
            Button {
                let message = text
                text = ""
                viewModel.send(message: message)
            } label: {
                if !text.isEmpty {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

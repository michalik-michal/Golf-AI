import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Divider()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.conversation) { conversation in
                        MessageView(model: conversation)
                    }
                }
            }
            HStack {
                TextField("Type here...", text: $text)
                    .foregroundColor(.white)
                Button {
                    viewModel.send(message: text)
                    text = ""
                } label: {
                    if !text.isEmpty {
                        Image(systemName: "paperplane")
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

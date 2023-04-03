import SwiftUI

struct HomeView: View {
    
    @State private var issueText = ""
    @State private var selectedClub = ""
    @FocusState private var focusTextEditor: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Golf AI")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("CustomGreen"))
                Spacer()
                Button {
                    // Reset
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 22, height: 24)
                }
                .padding(.horizontal)
            }
            Divider()
                .overlay(.white)
            ClubCellStack(selectedClub: $selectedClub)
            Text("Describe the issue")
                .font(.title)
                .bold()
            TextEditor(text: $issueText)
                .scrollContentBackground(.hidden)
                .background(Color("CustomGreen").opacity(0.5))
                .cornerRadius(12)
                .frame(height: 130)
                .focused($focusTextEditor)
            Spacer()
            Button {
                focusTextEditor = false
            } label: {
                Text("Done")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color("CustomGreen"))
                    .cornerRadius(12)
            }
            .padding(.bottom, 10)
        }
        .background(.black)
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

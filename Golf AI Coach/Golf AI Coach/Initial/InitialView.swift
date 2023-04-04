import SwiftUI

struct InitialView: View {
    
    @FocusState private var focusTextEditor: Bool
    @Binding var selectedClub: String
    @Binding var issueText: String
    @Binding var requestState: RequestState
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Golf AI")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("CustomGreen"))
                Spacer()
                Button {
                    selectedClub = ""
                    issueText = ""
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .resizable()
                        .frame(width: 21, height: 24)
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
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button {
                            focusTextEditor = false
                        } label: {
                            Text("Done")
                        }

                    }
                }
            Spacer()
            Button {
                focusTextEditor = false
                requestState = .compleated
            } label: {
                Text("Submit")
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

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(selectedClub: .constant("Driver"), issueText: .constant(""), requestState: .constant(.null))
    }
}

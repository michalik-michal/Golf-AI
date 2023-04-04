import SwiftUI

struct HomeView: View {
    
    @State private var issueText = ""
    @State private var selectedClub = ""
    @State private var requestState: RequestState = .null
    
    var body: some View {
        switch requestState {
        case .null:
            InitialView(selectedClub: $selectedClub, issueText: $issueText, requestState: $requestState)
        case .inProgress:
            Text("LOADING")
        case .compleated:
            ResultView(requestState: $requestState)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

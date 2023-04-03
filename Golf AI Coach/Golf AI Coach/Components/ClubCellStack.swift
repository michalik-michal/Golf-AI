import SwiftUI

struct ClubCellStack: View {
    
    @Binding var selectedClub: String
    
    var clubs = ["Driver", "Iron", "Wedge", "Putter"]
    
    var body: some View {
        Text("Select Club")
            .font(.title.bold())
        ScrollView(.horizontal) {
            HStack {
                ForEach(clubs, id: \.self) { club in
                    ClubCell(clubName: club)
                        .onTapGesture { selectedClub = club }
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(club == selectedClub ? Color.white : Color.clear, lineWidth: 2)
                                .padding(1))
                }
            }
        }
        .padding(.bottom)
    }
}

struct ClubCellStack_Previews: PreviewProvider {
    static var previews: some View {
        ClubCellStack(selectedClub: .constant(""))
    }
}

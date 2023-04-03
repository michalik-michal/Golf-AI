import SwiftUI

struct ClubCell: View {
    
    var clubName: String
    
    var body: some View {
        Text(clubName)
            .padding(8)
            .background(Color("CustomGreen"))
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct ClubCell_Previews: PreviewProvider {
    static var previews: some View {
        ClubCell(clubName: "Driver")
    }
}

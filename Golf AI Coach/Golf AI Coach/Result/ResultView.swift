import SwiftUI

struct ResultView: View {
    
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
                    requestState = .null
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 21, height: 24)
                }
                .padding(.horizontal)
            }
            Divider()
                .overlay(.white)
            ScrollView {
                VStack(alignment: .leading) {
                    Text("What to do?")
                        .padding(.bottom)
                        .font(.title.bold())
                    Text(mockResponse)
                        .font(.headline)
                    Button {
                        requestState = .null
                    } label: {
                        Text("Done")
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color("CustomGreen"))
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                }
            }
            Spacer()

        }
        .background(.black)
        .foregroundColor(.white)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(requestState: .constant(.compleated))
    }
}

let mockResponse = "If you're hitting your 7 iron and the ball is consistently going left (assuming you are a right-handed golfer), there are a few things you can try to improve your shot:Check your grip: Make sure you are holding the club correctly. The grip should be in the fingers of your left hand, and your right hand should be placed over your left hand with your thumb pointing down the shaft.Check your alignment: Aim the clubface where you want the ball to go and make sure your feet, hips, and shoulders are aligned parallel to the target line.Check your ball position: The ball should be positioned in the center of your stance, or slightly forward.Check your swing path: If your ball is going left, you may be swinging from outside the target line, which causes the clubface to close at impact. Try to swing more from the inside of the target line and focus on keeping the clubface square at impact.Practice: Hitting consistent shots takes practice, so keep working on your swing and trying different techniques until you find what works best for you.Remember to stay patient and keep practicing. Making small adjustments can lead to significant improvements in your shot accuracy over time."

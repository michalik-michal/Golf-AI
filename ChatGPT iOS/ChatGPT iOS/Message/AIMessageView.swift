import SwiftUI

struct AIMessageView: View {
    
    var message: String
    @State private var opacity = 0.0
    
    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .foregroundColor(.green)
                .frame(width: 30)
                .overlay {
                    Text("AI")
                }
            Text(message)
                .offset(y: 4)
            Spacer()
        }
        .opacity(opacity)
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(Color("secondaryBackground"))
        .onAppear {
            withAnimation {
                opacity = 1.0
            }
        }
    }
}

struct AIMessageView_Previews: PreviewProvider {
    static var previews: some View {
        AIMessageView(message: "This is a Preview Message")
    }
}

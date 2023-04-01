import SwiftUI

struct CustomTextField: View {
    let placeholderText: String

    @Binding var text: String

    var body: some View {
        ZStack {
            Color.gray
            TextField(placeholderText, text: $text)
                .padding()
        }
        .frame(height: 50)
        .cornerRadius(12)
    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholderText: "Type here", text: .constant(""))
    }
}

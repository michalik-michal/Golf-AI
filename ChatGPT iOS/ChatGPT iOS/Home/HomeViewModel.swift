import SwiftUI

class HomeViewModel: ObservableObject {

    let service = GPTService()
    @ObservedObject var connector = OpenAIConnector()
    @Published var conversation = [MessageModel]()
    @Published var requestState: RequestState = .null
    
    init() {
        service.setUp()
    }

    func send(message: String) {
        requestState = .inProgress
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.connector.logMessage(message, messageUserType: .user)
            self.connector.sendToAssistant()
            self.requestState = .inProgress
            self.conversation.append(MessageModel(messageType: .user, message: message))
            self.conversation.append(MessageModel(messageType: .ai, message: self.connector.messageLog.last?["content"] ?? ""))
            self.requestState = .completed
        }
    }
}

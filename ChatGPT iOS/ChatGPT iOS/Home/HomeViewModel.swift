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
        requestState = connector.requestState
        connector.logMessage(message, messageUserType: .user)
        connector.sendToAssistant()
        requestState = connector.requestState
        self.conversation.append(MessageModel(messageType: .user, message: message))
        self.conversation.append(MessageModel(messageType: .ai, message: connector.messageLog.last?["content"] ?? ""))
    }
}

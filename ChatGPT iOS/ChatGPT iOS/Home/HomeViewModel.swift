//
//  HomeViewModel.swift
//  ChatGPT iOS
//
//  Created by Michal Michalik on 30/03/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    let service = GPTService()
    let connector = OpenAIConnector()
    @Published var conversation = [MessageModel]()
    
    init() {
        service.setUp()
    }

    func send(message: String) {
        connector.logMessage(message, messageUserType: .user)
        connector.sendToAssistant()
        self.conversation.append(MessageModel(messageType: .user, message: message))
        self.conversation.append(MessageModel(messageType: .ai, message: connector.messageLog.last?["content"] ?? ""))
    }
}

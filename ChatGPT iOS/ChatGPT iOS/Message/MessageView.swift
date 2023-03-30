//
//  MessageView.swift
//  ChatGPT iOS
//
//  Created by Michal Michalik on 30/03/2023.
//

import SwiftUI

enum MessageType {
    case user
    case ai
}

struct MessageModel: Identifiable {
    var id = UUID()
    var messageType: MessageType
    var message: String
}

struct MessageView: View {
    
    var model: MessageModel
    
    var body: some View {
        switch model.messageType {
        case .user:
            UserMessageView(message: model.message)
        case .ai:
            AIMessageView(message: model.message)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(model: MessageModel(messageType: .ai, message: "Preview Response"))
    }
}

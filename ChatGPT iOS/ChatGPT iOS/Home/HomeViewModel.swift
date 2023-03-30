//
//  HomeViewModel.swift
//  ChatGPT iOS
//
//  Created by Michal Michalik on 30/03/2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    let service = GPTService()
    @Published var conversation = [MessageModel]()
    
    init() {
        service.setUp()
    }
    
    func send(message: String) {
        Task {
            do {
                await service.send(text: message) { result in
                    DispatchQueue.main.async {
                        self.conversation.append(MessageModel(messageType: .user, message: message))
                        self.conversation.append(MessageModel(messageType: .ai, message: result.trimmingCharacters(in: .whitespaces)))
                    }
                }
            }
        }
    }
}

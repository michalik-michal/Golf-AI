import Foundation
import OpenAIKit
import AsyncHTTPClient

class GPTService: ObservableObject {
    let apiKey = "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"
    let configuration = Configuration(apiKey: "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", organization: "")
    private var client: OpenAIKit.Client?
    var httpClient: HTTPClient?
    
    init() {}
    
    deinit {
        if httpClient != nil {
            try? httpClient!.syncShutdown()
        }
    }
    
    func setUp() {
        httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
        if httpClient != nil {
            client = OpenAIKit.Client(httpClient: httpClient!, configuration: configuration)
        }
    }
    
    func send(text: String, completion: @escaping (String) -> Void) async {
        Task {
            do {
                let result = try await client?.completions.create(model: Model.GPT3.ada, prompts: [text], maxTokens: 16)
                completion(result?.choices.first?.text ?? "")
            } catch {
                completion("error")
            }
        }
    }
}

//
//  RetrieveJokes.swift
//  ICanHazDadJoke

import Foundation

class JokeService: RandomJokeProtocol {
    
    func getRandomJoke(_ formatResponse: ContentType = .JSON, completion: @escaping (Data?, NetworkError?) -> ()) {
        var request = URLRequest(url: URL(string: JokeURL.randomJoke.rawValue)!)
        if (formatResponse == .JSON) {
            setHeaders(&request, contentType: ContentType.JSON.rawValue)
        }
        httpClient(request, completion)
    }
    
    private func setHeaders(_ request: inout URLRequest, contentType: String) {
        request.setValue(contentType, forHTTPHeaderField: "Accept")
    }
    
    private func httpClient(_ request: URLRequest, _ completion:  @escaping (Data?, NetworkError?) -> ()) {
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let networkError = NetworkError(data: data, response: response, error: error) {
                completion(.none, networkError)
            } else {
                completion(data, .none)
            }
        }.resume()
    }
}

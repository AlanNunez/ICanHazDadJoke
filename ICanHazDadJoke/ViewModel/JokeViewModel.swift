//
//  JokeViewModel.swift
//  ICanHazDadJoke

import Foundation

class JokeViewModel {
    private var jokeService: JokeService
    
    init() {
        jokeService = JokeService()
    }
    
    func getRandomJoke(completion: @escaping (DadJoke?, NetworkError?) -> ()) {
        jokeService.getRandomJoke() { joke, error in
            if error != nil {
                completion(.none, error)
            }
            
            if let joke = joke {
                let jokeObj = try? JSONDecoder().decode(DadJoke.self, from: joke)
                completion(jokeObj, .none)
            }
        }
    }
}

//
//  RandomJokeProtocol.swift
//  ICanHazDadJoke

import Foundation

protocol RandomJokeProtocol {
    func getRandomJoke(_ formatResponse: ContentType, completion: @escaping (Data?, NetworkError?) -> ())
}

//
//  ICanHazDadJokeTests.swift
//  ICanHazDadJokeTests

import XCTest
@testable import ICanHazDadJoke

class ICanHazDadJokeTests: XCTestCase {
    
    let dadJokeViewModel = JokeViewModel()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testRandomJokeService() throws {
        dadJokeViewModel.getRandomJoke() { response, error in
            if error != nil || response == nil || !(200...299).contains(response?.status ?? 0) {
                XCTFail()
            }
        }
    }
}

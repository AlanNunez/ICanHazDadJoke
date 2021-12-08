//
//  Error.swift
//  ICanHazDadJoke

import Foundation

enum NetworkError: Error {
    case transportError(Error)
    case HTTPStatusError
    case noData
}

extension NetworkError {
    
    init?(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            self = .transportError(error)
            return
        }
        
        if let response = response as? HTTPURLResponse,
           !(200...299).contains(response.statusCode) {
            self = .HTTPStatusError
            return
        }
        
        if data == nil {
            self = .noData
        }
        
        return nil
    }
    
    public var errorDescription: String? {
        switch self {
        case .HTTPStatusError:
            return NSLocalizedString("An expected error during the request. Please, try again later.", comment: "HTTP error")
            case .transportError(_):
                return NSLocalizedString("An expected error during the request. Please, try again.", comment: "Transport error")
            case .noData:
                return NSLocalizedString("An expected error ocurred. Please, try again.", comment: "No data")
        }
    }
}

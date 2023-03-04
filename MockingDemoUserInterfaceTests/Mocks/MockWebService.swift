//
//  MockWebService.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Karlos Aguirre Zaragoza on 03/03/23.
//

import Foundation

class MockWebService: NetworkService {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
}

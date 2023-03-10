//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Karlos Aguirre Zaragoza on 03/03/23.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment = environment {
            if environment == "TEST" {
                return MockWebService()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}

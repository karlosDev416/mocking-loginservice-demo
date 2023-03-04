//
//  LoginPageObject.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Karlos Aguirre Zaragoza on 03/03/23.
//

import Foundation
import XCTest

class LoginPageObject {
    
    var app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField: XCUIElement {
        app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        app.textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        app.buttons["loginButton"]
    }
    
    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
}

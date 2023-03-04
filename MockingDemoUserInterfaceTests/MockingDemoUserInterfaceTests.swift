//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Mohammad Azam on 10/12/21.
//

import XCTest

class when_user_clicks_on_login_button: XCTestCase {

    func test_should_display_error_message_for_missing_required_fields() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
        
    }
    
}

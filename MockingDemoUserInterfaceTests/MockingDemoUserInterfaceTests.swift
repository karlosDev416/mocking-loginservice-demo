//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Mohammad Azam on 10/12/21.
//

import XCTest

class when_user_clicks_on_login_button: XCTestCase {
    
    private var app: XCUIApplication!
    private var loginPageObject: LoginPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        loginPageObject = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
    }
    
    override func tearDown() {
        loginPageObject = nil
        app = nil
    }

    func test_should_display_error_message_for_missing_required_fields() {
                
        loginPageObject.usernameTextField.tap()
        loginPageObject.usernameTextField.typeText("")
                
        loginPageObject.passwordTextField.tap()
        loginPageObject.passwordTextField.typeText("")
                
        loginPageObject.loginButton.tap()
        
        XCTAssertEqual(loginPageObject.messageText.label, "Required fields are missing")
    }
    
    func test_should_navigate_to_dashboard_page_when_authenticated() {
                
        loginPageObject.usernameTextField.tap()
        loginPageObject.usernameTextField.typeText("JohnDoe")
                
        loginPageObject.passwordTextField.tap()
        loginPageObject.passwordTextField.typeText("Password")
                
        loginPageObject.loginButton.tap()
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func test_should_display_error_message_for_invalid_credentials() {
                
        loginPageObject.usernameTextField.tap()
        loginPageObject.usernameTextField.typeText("JohnDoe")
                
        loginPageObject.passwordTextField.tap()
        loginPageObject.passwordTextField.typeText("WrongPassword")
                
        loginPageObject.loginButton.tap()                
        XCTAssertEqual(loginPageObject.messageText.label, "Invalid credentials")
    }
}

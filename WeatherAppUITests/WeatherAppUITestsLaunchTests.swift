//
//  WeatherAppUITestsLaunchTests.swift
//  WeatherAppUITests
//
//  Created by mahesh lad on 29/11/2024.
//

import XCTest

final class WeatherAppUITestsLaunchTests: XCTestCase {

    var app: XCUIApplication!

       override func setUp() {
           super.setUp()
           continueAfterFailure = false
           app = XCUIApplication()
           app.launch()
       }
    
   
    func testWeatherAppView_success() throws {
        //Verify the ContentView is displaying the correct elements,
        // ie buttons and labels
        let app = XCUIApplication()
        
        XCTAssertTrue(app.staticTexts["Weather App"].exists)
        XCTAssertTrue(app.buttons["Get Weather"].exists)
        XCTAssertTrue( app.textFields["Enter location (e.g., London)"].exists)
    
        app.textFields["Enter location (e.g., London)"].tap()

        let lKey = app/*@START_MENU_TOKEN@*/.keys["L"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"L\"]",".keys[\"L\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
    

        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"o\"]",".keys[\"o\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
      

        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"n\"]",".keys[\"n\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
      
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"d\"]",".keys[\"d\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        oKey.tap()
        nKey.tap()
       
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"]",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
     
        app.buttons["Get Weather"].tap()
        
        
        let title = app.staticTexts["Current Weather"]
         XCTAssert(title.waitForExistence(timeout: 5)) //wait for deails to be displayed
        
        XCTAssertTrue(app.staticTexts["Temperature:"].exists)
        XCTAssertTrue(app.staticTexts["Feels Like:"].exists)
        XCTAssertTrue(app.staticTexts["Wind:"].exists)
        XCTAssertTrue(app.staticTexts["Gusts:"].exists)
        XCTAssertTrue(app.staticTexts["Rain:"].exists)
        XCTAssertTrue(app.staticTexts["Cloud Cover:"].exists)

        
    }
    
    func testWeatherAppView_Warning() throws {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.staticTexts["Weather App"].exists)
        XCTAssertTrue(app.buttons["Get Weather"].exists)
        XCTAssertTrue( app.textFields["Enter location (e.g., London)"].exists)
    
        app.textFields["Enter location (e.g., London)"].tap()

        let uKey = app.keys["U"]
        uKey.tap()
        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"].keys[\"n\"]",".keys[\"n\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        nKey.tap()
        let kKey = app.keys["k"]
        kKey.tap()
        nKey.tap()

        let oKey = app.keys["o"]
        oKey.tap()
     
        
        let wKey = app.keys["w"]
        wKey.tap()
        nKey.tap()
        nKey.tap()
        nKey.tap()
       
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".otherElements[\"UIKeyboardLayoutStar Preview\"]",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
     
        app.buttons["Get Weather"].tap()
        
        let errormsg = app.staticTexts["Error: Location not found"]
         XCTAssert(errormsg.waitForExistence(timeout: 5)) //wait for deails to be displayed
    }
}
                           


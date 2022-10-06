// swiftlint:disable all
import XCTest

final class MovieQuizUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
    }
    
    func testYesButton() {
        let firstPoster = app.images["Poster"] // находим первоначальный постер
        app.buttons["Yes"].tap() // находим кнопку "Да" и нажимаем
        
        let secondPoster = app.images["Poster"] // ещё раз находим постер
        let indexLabel = app.staticTexts["Index"]
        
        sleep(3)
        
        XCTAssertTrue(indexLabel.label == "2/10")
        XCTAssertFalse(firstPoster == secondPoster)
    }
    
    func testNoButton() {
        let firstPoster = app.images["Poster"] // находим первоначальный постер
        app.buttons["No"].tap() // находим кнопку "Да" и нажимаем
        
        let secondPoster = app.images["Poster"] // ещё раз находим постер
        let indexLabel = app.staticTexts["Index"]
        
        sleep(3)
        
        XCTAssertTrue(indexLabel.label == "2/10")
        XCTAssertFalse(firstPoster == secondPoster)
    }
    
    func testAlertShown() {
        while app.staticTexts["Index"].label != "10/10" {
            app.buttons["No"].tap()
            sleep(1)
        }
        let alert = app.alerts["shown_alert"]
        let alertIsExists = alert.exists
        let titleIsCorrect = alert.label == "Этот раунд окончен!"
        let buttonIsCorrect = alert.buttons.firstMatch.label == "Сыграть еще раз"
        XCTAssertNotNil(alert)
        XCTAssertEqual(alert.label, "Этот раунд окончен!")
        XCTAssertEqual(alert.buttons.firstMatch.label, "Сыграть еще раз")
        XCTAssertTrue(alertIsExists && titleIsCorrect && buttonIsCorrect)
    }
    
    

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
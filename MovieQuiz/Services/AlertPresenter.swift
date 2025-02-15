// swiftlint:disable all
import UIKit

class AlertPresenter {
    
    private let title: String
    private let text: String
    private let buttonText: String
    private weak var controller: UIViewController?
    private let accessibilityIdentifier: String?
    private let onAction: ((UIAlertAction) -> Void)?
    
    init(
        title: String,
        text: String,
        buttonText: String,
        controller: UIViewController,
        accessibilityIdentifier: String? = nil,
        onAction: ((UIAlertAction) -> Void)?
    ) {
        self.title = title
        self.text = text
        self.buttonText = buttonText
        self.controller = controller
        self.accessibilityIdentifier = accessibilityIdentifier
        self.onAction = onAction
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        alert.view.accessibilityIdentifier = accessibilityIdentifier
        
        let action = UIAlertAction(title: buttonText, style: .default, handler: {
            action in self.onAction?(action)
        })
        
        alert.addAction(action)
        DispatchQueue.main.async {
            self.controller?.present(alert, animated: true, completion: nil)
        }
    }
}

//
//  UITextField+Extensions.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

extension UITextField {
    func addToolbarWithDoneButton(target: Any?, action: Selector?) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: target, action: action)
        toolbar.items = [flexSpace, doneButton]
        inputAccessoryView = toolbar
    }
    
    func setCenteredPlaceholder(text: String, font: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular), color: UIColor = .lightGray) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .paragraphStyle: paragraphStyle,
            .font: font
        ]
        
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
}

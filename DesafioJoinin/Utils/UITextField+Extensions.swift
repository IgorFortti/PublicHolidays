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
}

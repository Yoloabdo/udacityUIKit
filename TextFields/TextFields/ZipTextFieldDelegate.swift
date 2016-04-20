//
//  zipTextFieldDelegate.swift
//  TextFields
//
//  Created by Abdulrhman  eaita on 4/20/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

class ZipTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let textCount = textField.text?.characters.count
        if textCount > 4 {
            textField.enabled = false
            return false
        }else {
            return true
        }
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
}
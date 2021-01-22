//
//  NSObject+Keyboard.swift
//  ExampleApplication
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - Keyboard managements
@objc public extension NSObject {
    
    /// Hide keyboard functional
    @objc func afKeyboardHide() {
        AFKeyboardHelper.hide()
    }
    
}
#endif

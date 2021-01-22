//
//  UIView+Tap.swift
//  ExampleApplication
//
//  Created by dlernatovich 
//

import Foundation
#if os(iOS)
import UIKit

//MARK: - Tap functional
@objc public extension UIView {
    
    /// Method which provide the add tap
    /// - Parameter target: object
    /// - Parameter selector: object
    @discardableResult
    @objc func addTap(target: Any?, selector: Selector?) -> UITapGestureRecognizer? {
        guard let target = target, let selector = selector else {return nil;}
        self.isUserInteractionEnabled = true;
        let recognizer = UITapGestureRecognizer.init(target: target, action: selector);
        recognizer.numberOfTapsRequired = 1;
        recognizer.numberOfTouchesRequired = 1;
        recognizer.isEnabled = true;
        self.addGestureRecognizer(recognizer);
        return recognizer;
    }
    
}
#endif

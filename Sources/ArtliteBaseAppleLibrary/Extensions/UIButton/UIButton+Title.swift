//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich on 25.01.2021.
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Set title
@objc public extension UIButton {
    
    /// Title variable
    @objc var afTitle: String? {
        set { afSetTitle(value: newValue) }
        get { self.titleLabel?.text }
    }
    
    /// Method which provide the setting title value for state.
    /// - Parameters:
    ///   - value: title value
    @objc func afSetTitle(value: String?) {
        afSetTitle(value: value, for: UIControl.State.allStates)
    }
    
    /// Method which provide the setting title value for state.
    /// - Parameters:
    ///   - value: title value
    ///   - states: array of states
    @nonobjc func afSetTitle(value: String?, for states: [UIControl.State]) {
        for state in states { afSetTitle(value: value, for: state) }
    }
    
    /// Method which provide the setting title value for state.
    /// - Parameters:
    ///   - value: title value
    ///   - state: value
    @objc func afSetTitle(value: String?, for state: UIControl.State) {
        self.setTitle(value, for: state)
    }
    
}
#endif

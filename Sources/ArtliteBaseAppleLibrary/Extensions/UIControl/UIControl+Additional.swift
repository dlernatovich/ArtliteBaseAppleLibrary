//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich on 25.01.2021.
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - State extension
public extension UIControl.State {
    
    /// Array of the all states
    static var allStates: [UIControl.State] { [.normal, .highlighted, .disabled, .selected, .focused, .application, .reserved] }
    
    /// Array of the normal states
    static var normalStates: [UIControl.State] { [.normal] }
    
    /// Array of the disabled states
    static var disabledStates: [UIControl.State] { [.disabled] }
    
    /// Array of the pressed states
    static var pressedStates: [UIControl.State] { [.highlighted, .selected, .focused] }
    
}

#endif

//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// AF button functional
@objc open class AFButtonObjc: UIButton {
    
    /// Enabled button alpha
    @IBInspectable var enabledButtonAlpha: CGFloat = 1.0 {
        didSet {
            if enabledButtonAlpha < 0 { enabledButtonAlpha = 0.0 }
            if enabledButtonAlpha > 1 { enabledButtonAlpha = 1.0 }
        }
    }
    
    /// Disabled button alpha
    @IBInspectable var disabledButtonAlpha: CGFloat = 0.5 {
        didSet {
            if disabledButtonAlpha < 0 { disabledButtonAlpha = 0.0 }
            if disabledButtonAlpha > 1 { disabledButtonAlpha = 1.0 }
        }
    }
    
    /// Normal button background color.
    @IBInspectable var normalColor: UIColor? {
        didSet {
            if let color = normalColor { self.setBackgroundColor(color: color, forState: .normal) }
        }
    }
    
    /// Press button background color.
    @IBInspectable var pressColor: UIColor? {
        didSet {
            let states: [UIControl.State] = [.selected, .highlighted]
            if let color = pressColor {
                for state in states {
                    self.setBackgroundColor(color: color, forState: state)
                }
            }
        }
    }
    
    /// Override enabled button
    open override var isEnabled: Bool {
        didSet { self.alpha = (isEnabled == true) ? enabledButtonAlpha : disabledButtonAlpha }
    }
    
}

/// AF button functional
open class AFButton: AFButtonObjc { }
#endif

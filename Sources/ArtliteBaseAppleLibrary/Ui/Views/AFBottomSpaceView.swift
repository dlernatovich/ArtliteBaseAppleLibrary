//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Bottom space view
@objc public class AFBottomSpaceView: UIView {
    
    /// Init view with frame
    /// - Parameter frame: frame rect
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    /// Init view with coder
    /// - Parameter aDecoder: instance of the coder
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    /// Common init
    func commonInit() {
        NSLayoutConstraint(
            item: self,
            attribute: NSLayoutConstraint.Attribute.height,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1,
            constant: self.afSafeBottom
        ).isActive = true
    }
    
}
#endif

//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Objc base view
@objc open class AFViewObjc: UIView {
    
    /// View instance
    @IBOutlet open weak var contentView: UIView!
    
    /// Instance of the current {@link Bundle}
    @objc open var currentBundle: Bundle { Bundle(for: type(of: self)) }
    
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
        self.currentBundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil);
        self.contentView.fixInView(self)
        self.onViewCreated()
    }
    
    /// On view created
    @objc open func onViewCreated() {
        // METHOD FOR OVERRIDING
    }
    
}

// MARK: - Base view for swift
open class AFView: UIView {
    
    /// View instance
    @IBOutlet open weak var contentView: UIView!
    
    /// Instance of the current {@link Bundle}
    open var currentBundle: Bundle { Bundle(for: type(of: self)) }
    
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
        self.currentBundle.loadNibNamed(String(describing: Self.self), owner: self, options: nil);
        self.contentView.fixInView(self)
        self.onViewCreated()
    }
    
    /// On view created
    open func onViewCreated() {
        // METHOD FOR OVERRIDING
    }
    
}

private extension UIView {
    
    /// Method which provide the fix view
    /// - Parameter container: instance of the container
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
#endif

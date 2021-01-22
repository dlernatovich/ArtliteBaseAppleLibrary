//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

// MARK: - Close functional
@objc public extension UIViewController {
    
    /// Close UIViewController
    /// - Parameter animated: if it animated
    @objc func afClose(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.navigationController?.popViewController(animated: animated)
        self.dismiss(animated: animated, completion: completion)
    }
    
    /// Method which provide the close visible controller
    /// - Parameter animated: if it need animated
    @objc static func afCloseVisible(animated: Bool = true, completion: (() -> Void)? = nil) {
        AFControllerHelper.getVisibleController()?.afClose(animated: animated, completion: completion)
    }
    
}

// MARK: - Show functionality
@objc public extension UIViewController {
    
    /// Show view controller from storyboard name and identifier
    /// - Parameters:
    ///   - storyboard: storyboard name
    ///   - name: controller identifier
    @discardableResult
    @objc func afShow(
        from destination: AFDestModel,
        preperform handler: ((_ controller: UIViewController) -> Void)? = nil
    ) -> UIViewController? {
        let controller = AFStoryboardHelper.show(owner: self, from: destination.storyboard, and: destination.controller, preconfigure: { (ct) in
            if let typed = ct as? AFController { typed.type = destination; typed.displayType = .normal }
            if let typed = ct as? AFControllerObjc { typed.type = destination; typed.displayType = .normal }
        }, preperform: handler)
        return controller
    }
    
    /// Show view controller from storyboard name and identifier
    /// - Parameters:
    ///   - storyboard: storyboard name
    ///   - name: controller identifier
    @discardableResult
    func afShow(
        detailsFrom destination: AFDestModel,
        preperform handler: ((_ controller: UIViewController) -> Void)? = nil
    ) -> UIViewController? {
        let controller = AFStoryboardHelper.show(owner: self, detailsFrom: destination.storyboard, and: destination.controller, preconfigure: { (ct) in
            if let typed = ct as? AFController { typed.type = destination; typed.displayType = .details }
            if let typed = ct as? AFControllerObjc { typed.type = destination; typed.displayType = .details }
        }, preperform: handler)
        return controller
    }
    
}

// MARK: - Back to controller functional
@objc public extension UIViewController {
    
    /// Method which provide back to controller.
    /// - Parameters:
    ///   - controller: destination controller.
    @objc func afBack(to controller: AFDestModel) {
        AFControllerHelper.back(to: controller, with: self, animated: true)
    }
    
    /// Method which provide back to controller.
    /// - Parameters:
    ///   - controller: destination controller.
    ///   - animated: if it animated.
    @objc func afBack(to controller: AFDestModel, animated: Bool) {
        AFControllerHelper.back(to: controller, with: self, animated: animated)
    }
    
}

// MARK: - Remove functional
@objc public extension UIViewController {
    
    /// Method which provide the removing controller from navigation stack
    /// - Parameter controller: type
    @objc func afRemove(controller: AFDestModel) {
        AFControllerHelper.remove(controller: controller)
    }
    
    /// Method which provide the removing controller from navigation stack
    /// - Parameter controllers: array
    @objc func afRemove(controllers: Array<AFDestModel>) {
        AFControllerHelper.remove(controllers: controllers)
    }
    
}

#endif

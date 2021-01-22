//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit


/// Controller helper
@objc public class AFControllerHelper: NSObject {}

// MARK: - Visiblity controller
@objc public extension AFControllerHelper {
    
    /// Method which provide the getting of the top most visible controller
    /// - Returns: instance of the {@link UIViewController}
    /// Method which provide the getting of the top view controller
    ///
    /// - Returns: top view controller
    @objc class func getVisibleController() -> UIViewController? {
        getVisibleController(controller: NSObject.afGlobalKeyWindow?.rootViewController)
    }
    
    /// Method which provide the getting of the top most visible controller
    /// - Returns: instance of the {@link UIViewController}
    /// Method which provide the getting of the top view controller
    ///
    /// - Parameter controller: view controller
    /// - Returns: top view controller
    @objc class func getVisibleController(controller: UIViewController?) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return getVisibleController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return getVisibleController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return getVisibleController(controller: presented)
        }
        return controller;
    }
    
}

// MARK: - Child controllers
@objc public extension AFControllerHelper {
    
    /// Method which provide the adding of the child view controller
    /// - Parameters:
    ///   - child: child
    ///   - view: UIView
    @objc static func addChildController(child: UIViewController, to view: UIView?) {
        addChildController(owner: getVisibleController(), child: child, to: view)
    }
    
    /// Method which provide the adding of the child view controller
    /// - Parameters:
    ///   - child: child
    ///   - view: UIView
    @objc static func addChildController(owner: UIViewController?, child: UIViewController, to view: UIView?) {
        guard let view = view, let owner = owner else { return }
        owner.addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: owner)
    }
    
    /// Method which provide the remove controller from parent
    @objc static func removeFromParent(child: UIViewController?) {
        guard let child = child else { return }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
}

// MARK: - Back to controllers from stack
@objc public extension AFControllerHelper {
    
    /// Method which provide back to controller.
    /// - Parameters:
    ///   - controller: destination controller.
    @objc static func back(to controller: AFDestModel) {
        back(to: controller, with: getVisibleController(), animated: true)
    }
    
    /// Method which provide back to controller.
    /// - Parameters:
    ///   - controller: destination controller.
    ///   - animated: if it animated.
    @objc static func back(to controller: AFDestModel, animated: Bool) {
        back(to: controller, with: getVisibleController(), animated: animated)
    }
    
    /// Method which provide back to controller.
    /// - Parameters:
    ///   - controller: destination controller.
    ///   - owner: owner controller.
    @objc static func back(to controller: AFDestModel, with owner: UIViewController?) {
        back(to: controller, with: owner, animated: true)
    }
    
    /// Method which provide back to controller.
    /// - Parameters:
    ///   - controller: destination controller.
    ///   - owner: owner controller.
    ///   - animated: if it animated.
    @objc static func back(to controller: AFDestModel, with owner: UIViewController?, animated: Bool) {
        guard let owner = owner, let controllers = owner.navigationController?.viewControllers else { return }
        var back: UIViewController? = nil;
        for item in controllers {
            if let base = item as? AFController,
                base.type == controller {
                back = base;
                break;
            }
        }
        if let back = back { owner.navigationController?.popToViewController(back, animated: animated) }
    }
    
}

/*
 /// Method which provide the removing controller from navigation stack
 /// - Parameter controller: instance of the {@link Controllers}
 func remove(controllers: Controllers...) {
     self.navigation?.viewControllers.removeAll(where: { (controller) -> Bool in
         if let base = controller as? BaseViewController, base.type != .none {
             return controllers.contains(base.type);
         }
         return false;
     });
 }
 */
// MARK: - Back to controllers from stack
@objc public extension AFControllerHelper {
    
    /// Method which provide the removing controller from navigation stack
    /// - Parameter controller: type
    @objc static func remove(controller: AFDestModel) {
        remove(owner: getVisibleController(), controller: controller)
    }
    
    /// Method which provide the removing controller from navigation stack
    /// - Parameter controllers: array
    @objc static func remove(controllers: Array<AFDestModel>) {
        remove(owner: getVisibleController(), controllers: controllers)
    }
    
    /// Method which provide the removing controller from navigation stack
    /// - Parameters:
    ///   - owner: controller
    ///   - controller: type
    @objc static func remove(owner: UIViewController?, controller: AFDestModel) {
        remove(owner: owner, controllers: [controller])
    }
    
    
    /// Method which provide the removing controller from navigation stack
    /// - Parameters:
    ///   - owner: controller
    ///   - controllers: array
    @objc static func remove(owner: UIViewController?, controllers: Array<AFDestModel>) {
        guard let owner = owner else { return }
        owner.navigationController?.viewControllers.removeAll(where: { (controller) -> Bool in
            if let base = controller as? AFController, base.type != .none {
                return controllers.contains(base.type);
            }
            return false;
        });
    }
    
}
#endif

//
//  File.swift
//  
//
//  Created by Dmitry Lernatovich 
//

import Foundation
#if os(iOS)
import UIKit

/// Storyboard helper
@objc public class AFStoryboardHelper: NSObject {
    
    /// Show view controller from storyboard name and identifier
    /// - Parameters:
    ///   - storyboard: storyboard name
    ///   - name: controller identifier
    @discardableResult
    @objc public static func show(
        owner: UIViewController?,
        from storyboard: String?,
        and name: String?,
        preperform handler: ((_ controller: UIViewController) -> Void)? = nil
    ) -> UIViewController? {
        guard let storyboard = storyboard, let name = name, let owner = owner else { return nil }
        let storyboardObject = UIStoryboard(name: storyboard, bundle: Bundle(for: type(of: owner) as AnyClass))
        let destination = storyboardObject.instantiateViewController(withIdentifier: name)
        handler?(destination)
        owner.navigationController?.show(destination, sender: self)
        return destination
    }
    
    /// Show view controller from storyboard name and identifier
    /// - Parameters:
    ///   - storyboard: storyboard name
    ///   - name: controller identifier
    @discardableResult
    @objc internal static func show(
        owner: UIViewController?,
        from storyboard: String?,
        and name: String?,
        preconfigure callback: ((_ controller: UIViewController) -> Void)? = nil,
        preperform handler: ((_ controller: UIViewController) -> Void)? = nil
    ) -> UIViewController? {
        guard let storyboard = storyboard, let name = name, let owner = owner else { return nil }
        let storyboardObject = UIStoryboard(name: storyboard, bundle: Bundle(for: type(of: owner) as AnyClass))
        let destination = storyboardObject.instantiateViewController(withIdentifier: name)
        callback?(destination)
        handler?(destination)
        owner.navigationController?.show(destination, sender: self)
        return destination
    }
    
    /// Show view controller from storyboard name and identifier
    /// - Parameters:
    ///   - storyboard: storyboard name
    ///   - name: controller identifier
    @discardableResult
    @objc public static func show(
        owner: UIViewController?,
        detailsFrom storyboard: String?,
        and name: String?,
        preperform handler: ((_ controller: UIViewController) -> Void)? = nil
    ) -> UIViewController? {
        guard let storyboard = storyboard, let name = name, let owner = owner else { return nil }
        let storyboardObject = UIStoryboard(name: storyboard, bundle: Bundle(for: type(of: owner) as AnyClass))
        let destination = storyboardObject.instantiateViewController(withIdentifier: name)
        handler?(destination)
        owner.navigationController?.present(destination, animated: true, completion: nil)
        return destination
    }
    
    /// Show view controller from storyboard name and identifier
    /// - Parameters:
    ///   - storyboard: storyboard name
    ///   - name: controller identifier
    @discardableResult
    @objc internal static func show(
        owner: UIViewController?,
        detailsFrom storyboard: String?,
        and name: String?,
        preconfigure callback: ((_ controller: UIViewController) -> Void)? = nil,
        preperform handler: ((_ controller: UIViewController) -> Void)? = nil
    ) -> UIViewController? {
        guard let storyboard = storyboard, let name = name, let owner = owner else { return nil }
        let storyboardObject = UIStoryboard(name: storyboard, bundle: Bundle(for: type(of: owner) as AnyClass))
        let destination = storyboardObject.instantiateViewController(withIdentifier: name)
        callback?(destination)
        handler?(destination)
        owner.navigationController?.present(destination, animated: true, completion: nil)
        return destination
    }
    
}
#endif

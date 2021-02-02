//
//  DefaultsNullableWrapper.swift
//  ApiFramework
//
//  Created by Dmitry Lernatovich
//

import Foundation

// MARK: - User defaults wrapper

/// Default property wrapper
@propertyWrapper
public struct AFDefaultsNullableWrapper<Value> {
    
    /// Key value
    public let key: String;
    
    /// Storage defaults
    public var storage: UserDefaults = .standard;
    
    /// Wrapped value
    public var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set {
            if (newValue == nil) {
                storage.removeObject(forKey: key);
            } else {
                storage.setValue(newValue, forKey: key);
            }
        }
    }
}

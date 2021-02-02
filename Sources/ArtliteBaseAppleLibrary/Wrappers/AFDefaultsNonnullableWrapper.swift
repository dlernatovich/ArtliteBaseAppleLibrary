//
//  DefaultsNonnullableWrapper.swift
//  ApiFramework
//
//  Created by Dmitry Lernatovich
//

import Foundation

/// Default property wrapper
@propertyWrapper
public struct AFDefaultsNonnullableWrapper<Value> {
    
    /// Key value
    let key: String;
    
    /// Default value
    let defaultValue: Value;
    
    /// Storage defaults
    var storage: UserDefaults = .standard;
    
    /// Wrapped value
    public var wrappedValue: Value {
        get { storage.value(forKey: key) as? Value ?? defaultValue }
        set {
            storage.setValue(newValue, forKey: key);
        }
    }
}

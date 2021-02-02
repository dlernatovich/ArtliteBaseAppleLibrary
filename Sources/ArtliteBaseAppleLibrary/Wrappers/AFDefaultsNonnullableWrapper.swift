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
    public let key: String;
    
    /// Default value
    public let defaultValue: Value;
    
    /// Storage defaults
    public var storage: UserDefaults = .standard;
    
    
    /// Default constructor
    /// - Parameters:
    ///   - key: value
    ///   - defaultValue: default value
    ///   - storage: storage for saving
    public init(key: String, defaultValue: Value, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }
    
    /// Wrapped value
    public var wrappedValue: Value {
        get { storage.value(forKey: key) as? Value ?? defaultValue }
        set {
            storage.setValue(newValue, forKey: key);
        }
    }
}

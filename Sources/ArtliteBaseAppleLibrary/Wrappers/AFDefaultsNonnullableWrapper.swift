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
    
    // Read rule
    public var read: AFWrapperRead<Value>? = nil
    
    /// Save rule
    public var write: AFWrapperWrite<Value>? = nil
    
    /// Storage defaults
    public var storage: UserDefaults = .standard;
    
    
    /// Default constructor.
    /// - Parameters:
    ///   - key: value
    ///   - defaultValue: default value
    ///   - storage: storage for saving
    ///   - read: read rule
    ///   - write: write rule
    public init(key: String, defaultValue: Value, storage: UserDefaults = .standard, read: AFWrapperRead<Value>? = nil, write: AFWrapperWrite<Value>? = nil) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
        self.read = read
        self.write = write
    }
    
    /// Wrapped value
    public var wrappedValue: Value {
        get {
            if let read = read {
                return read(storage, key) ?? defaultValue
            }
            return storage.value(forKey: key) as? Value ?? defaultValue
        }
        set {
            if let write = write {
                write(storage, key, newValue)
            } else {
                storage.setValue(newValue, forKey: key)
            }
        }
    }
}

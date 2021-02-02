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
    
    // Read rule
    public var read: AFWrapperRead<Value>? = nil
    
    /// Save rule
    public var write: AFWrapperWrite<Value>? = nil
    
    /// Storage defaults
    public var storage: UserDefaults = .standard;
    
    /// Default constructor
    /// - Parameters:
    ///   - key: key value
    ///   - storage: storage for save
    ///   - read: read rule
    ///   - write: write rule
    public init(key: String, storage: UserDefaults = .standard, read: AFWrapperRead<Value>? = nil, write: AFWrapperWrite<Value>? = nil) {
        self.key = key
        self.storage = storage
        self.read = read
        self.write = write
    }
    
    /// Wrapped value
    public var wrappedValue: Value? {
        get {
            if let read = read {
                return read(storage, key)
            }
            return storage.value(forKey: key) as? Value
        }
        set {
            guard let newValue = newValue else {
                storage.removeObject(forKey: key)
                return
            }
            if let write = write {
                write(storage, key, newValue)
            } else {
                storage.setValue(newValue, forKey: key)
            }
        }
    }
}

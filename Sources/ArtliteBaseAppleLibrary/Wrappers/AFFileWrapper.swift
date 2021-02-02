//
//  FileWrapper.swift
//  ApiFramework
//
//  Created by Dmitry Lernatovich
//

import Foundation

/// File type enum
public enum AFFileType: String {
    case JSON = "json",
         DAT = "dat",
         BIN = "bin"
}

/// File wrapper
@propertyWrapper
public struct AFFileWrapper<Value: Codable> {
    
    /// Folder name
    var folderName: (() -> String?)? = nil;
    
    ///file name
    var fileName: () -> String?;
    
    /// Format
    var fileType: AFFileType = .JSON;
    
    /// Full path value
    private var fullPath: String {
        if let folderName = folderName?() {
            return String.init(format: "%@/%@.%@", folderName, fileName()!, fileType.rawValue);
        }
        return String.init(format: "%@.%@", fileName()!, fileType.rawValue);
    }
    
    /// Wrapped value
    public var wrappedValue: Value? {
        get {
            if (fileName() == nil) {
                return nil;
            }
            return Value.getFromDocumments(key: fullPath)
        }
        set {
            if (fileName() == nil) {
                return;
            }
            #if DEBUG
            print("Start writting an object \(String(describing: newValue)) for file at path \(fullPath)")
            #endif
            if (newValue == nil) {
                Value.removeInDocuments(key: fullPath);
            } else {
                newValue!.saveToDocumments(key: fullPath);
            }
        }
    }
}

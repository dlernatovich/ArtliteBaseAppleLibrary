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
    public var folderName: (() -> String?)? = nil;
    
    ///file name
    public var fileName: () -> String?;
    
    /// Format
    public var fileType: AFFileType = .JSON;
    
    /// Default constructor.
    /// - Parameters:
    ///   - fileName: file name definer
    ///   - folderName: folder name definer
    ///   - fileType: file type
    init(fileName: @escaping () -> String?, folderName: (() -> String?)? = nil, fileType: AFFileType = .JSON) {
        self.fileName = fileName
        self.folderName = folderName
        self.fileType = fileType
    }
    
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

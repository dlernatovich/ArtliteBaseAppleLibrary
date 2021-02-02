//
//  Paths.swift
//  ApiFramework
//
//  Created by Dmitry Lernatovich
//

import Foundation

/// CHeck if file exists at documents directory
/// - Parameter fileName: file name value
/// - Returns: URL to file
public func gFileExistsAtDocuments(
    folderName: String? = nil,
    fileName: String
) -> URL? {
    var url: URL? = nil;
    if let folderName = folderName {
        url = gPathDocument?
            .appendingPathComponent(folderName)
            .appendingPathComponent(fileName);
    } else {
        url = gPathDocument?
            .appendingPathComponent(fileName);
    }
    guard let strongUrl = url else {
        return nil;
    }
    let fileManager = FileManager.default;
    if (fileManager.fileExists(atPath: strongUrl.path)) {
        return url;
    }
    return nil;
}

/// Create folder functional
/// - Parameters:
///   - url: url path
///   - fileManager: instance of the {@link FileManager}
/// - Throws: error
public func gCreateFolders(
    in url: URL,
    manager fileManager: FileManager = .default
) throws {
    let folderUrl = url.deletingLastPathComponent();
    if !fileManager.fileExists(atPath: folderUrl.path) {
        try fileManager
            .createDirectory(at: folderUrl,
                             withIntermediateDirectories: true,
                             attributes: nil);
    }
}

/// Document path URL
public var gPathDocument: URL? {
    do {
        let url = try FileManager
            .default.url(for: .documentDirectory,
                         in: .userDomainMask,
                         appropriateFor: nil,
                         create: true);
        return url;
    } catch let error {
        #if DEBUG
        print("Catch error while get the file path.\nException: %@", error)
        #endif
    }
    return nil;
}

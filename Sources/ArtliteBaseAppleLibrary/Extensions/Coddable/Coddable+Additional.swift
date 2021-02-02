//
//  Coddable+Additional.swift
//  ApiFramework
//
//  Created by Dmitry Lernatovich
//

import Foundation

// MARK: - Save to user defaults
public extension Encodable {
    
    /// Method which provide to saving codable to UserDefaults
    /// - Parameter key: key value
    func saveToDefaults(key: String?) {
        guard let key = key else {
            return;
        }
        let encoder = JSONEncoder();
        if let encoded = try? encoder.encode(self) {
            let defaults = UserDefaults.standard;
            defaults.set(encoded, forKey: key);
        }
    }
    
    // EXAMPLE
    //struct Timeline: Codable {
    //    let tweets: [String]
    //}
    //
    //let path = URL(fileURLWithPath: NSTemporaryDirectory())
    //let disk = DiskStorage(path: path)
    //let storage = CodableStorage(storage: disk)
    //
    //let timeline = Timeline(tweets: ["Hello", "World", "!!!"])
    //try storage.save(timeline, for: "timeline")
    //let cached: Timeline = try storage.fetch(for: "timeline")
    
    /// Method which provide the save to documments
    /// - Parameter key: value
    func saveToDocumments(key: String?) {
        guard let path = gPathDocument,
              let key = key else {
            return;
        }
        let disk = DiskStorage(path: path);
        let storage = CodableStorage(storage: disk);
        do {
            #if DEBUG
            print("saveToDocumments ->\nObject:\n\(self)\npath: \(path)");
            #endif
            try storage.save(self, for: key);
        } catch {
            #if DEBUG
            print("Can't save the file with key: \(key)");
            #endif
        }
    }
    
}

// MARK: - Get from user defaults
public extension Decodable {
    
    /// Method which provide to getting codable from UserDefaults
    /// - Parameter key: key value
    static func getFromDefaults<T:Decodable>(key: String?) -> T? {
        guard let key = key else {
            return nil;
        }
        let defaults = UserDefaults.standard;
        if let data = defaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(Self.self, from: data) {
                return object as? T;
            }
        }
        return nil;
    }
    
    /// Method which provide the read from documments
    /// - Parameter key: value
    static func getFromDocumments<T:Decodable>(key: String?) -> T? {
        guard let path = gPathDocument,
              let key = key else {
            return nil;
        }
        let disk = DiskStorage(path: path);
        let storage = CodableStorage(storage: disk);
        do {
            return try storage.fetch(for: key);
        } catch {
            #if DEBUG
            print("Can't read the file with key: \(key)");
            #endif
        }
        return nil;
    }
    
    /// Method which provide the remove from documments
    /// - Parameter key: value
    static func removeInDocuments(key: String?) {
        guard let path = gPathDocument,
              let key = key else {
            return;
        }
        let fullPath = path.appendingPathComponent(key).path;
        #if DEBUG
        print("removeInDocuments -> Full path: \(fullPath)");
        #endif
        do {
            try FileManager.default.removeItem(atPath: fullPath);
        } catch {
            #if DEBUG
            print("removeInDocuments -> Can't remove file at path: \(fullPath)");
            #endif
        }
    }
    
}

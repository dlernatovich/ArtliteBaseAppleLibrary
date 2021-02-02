//
//  AFFileStorage.swift
//  ApiFramework
//
//  Created by Dmitry Lernatovich
//

import UIKit

/// Handler
typealias Handler<T> = (Result<T, Error>) -> Void;
/// Storage typealias
typealias Storage = ReadableStorage & WritableStorage;

/// Redable storage
protocol ReadableStorage {
    /// Method which provide the fetch functional
    /// - Parameter key: value
    func fetchValue(for key: String) throws -> Data;
    /// Method which provide the fetch functional
    /// - Parameters:
    ///   - key: value
    ///   - handler: callback
    func fetchValue(for key: String, handler: @escaping Handler<Data>);
}

/// Writable storage
protocol WritableStorage {
    /// Method which provide the save functional
    /// - Parameters:
    ///   - value: data
    ///   - key: value
    func save(value: Data, for key: String) throws;
    /// Method which provide the save functional
    /// - Parameters:
    ///   - value: date
    ///   - key: value
    ///   - handler: callback
    func save(value: Data, for key: String, handler: @escaping Handler<Data>);
}

/// Storage error
enum StorageError: Error {
    /// Not found error
    case notFound;
    /// Can write error
    case cantWrite(Error);
}

/// Disc cache storage
class DiskStorage {
    /// Instance of the {@link DispatchQueue}
    private let queue: DispatchQueue;
    /// Instance of the {@link FileManager}
    private let fileManager: FileManager;
    /// Instance of the {@link URL}
    private let path: URL;
    
    /// Method which provide the init functioanlity
    /// - Parameters:
    ///   - path: value
    ///   - queue: instance of the {@link DispatchQueue}
    ///   - fileManager: instance of the {@link FileManager}
    init(path: URL,
         queue: DispatchQueue = .init(label: "DiskCache.Queue"),
         fileManager: FileManager = FileManager.default) {
        self.path = path;
        self.queue = queue;
        self.fileManager = fileManager;
    }
}

/// Writable storage extension
extension DiskStorage: WritableStorage {
    /// Method which provide the save functional
    /// - Parameters:
    ///   - value: data
    ///   - key: value
    func save(value: Data, for key: String) throws {
        let url = path.appendingPathComponent(key);
        do {
            try self.createFolders(in: url);
            try value.write(to: url, options: .atomic);
        } catch {
            throw StorageError.cantWrite(error);
        }
    }
    /// Method which provide the save functional
    /// - Parameters:
    ///   - value: date
    ///   - key: value
    ///   - handler: callback
    func save(value: Data, for key: String, handler: @escaping Handler<Data>) {
        queue.async {
            do {
                try self.save(value: value, for: key);
                handler(.success(value));
            } catch {
                handler(.failure(error));
            }
        }
    }
}

/// Create folder extension
extension DiskStorage {
    /// Create folder functional
    /// - Parameter url: url path
    private func createFolders(in url: URL) throws {
        let folderUrl = url.deletingLastPathComponent();
        if !fileManager.fileExists(atPath: folderUrl.path) {
            try fileManager.createDirectory(at: folderUrl, withIntermediateDirectories: true, attributes: nil);
        }
    }
}

/// Readable storage
extension DiskStorage: ReadableStorage {
    /// Method which provide the fetch functional
    /// - Parameter key: value
    func fetchValue(for key: String) throws -> Data {
        let url = path.appendingPathComponent(key);
        guard let data = fileManager.contents(atPath: url.path) else {
            throw StorageError.notFound;
        }
        return data;
    }
    /// Method which provide the fetch functional
    /// - Parameters:
    ///   - key: value
    ///   - handler: callback
    func fetchValue(for key: String, handler: @escaping Handler<Data>) {
        queue.async {
            handler(Result { try self.fetchValue(for: key) });
        }
    }
}

/// Coddable storage
class CodableStorage {
    /// Instance of the {@link DiskStorage}
    private let storage: DiskStorage;
    /// Instance of the {@link JSONDecoder}
    private let decoder: JSONDecoder;
    /// Instance of the {@link JSONEncoder}
    private let encoder: JSONEncoder;

    
    /// Default constructor
    /// - Parameters:
    ///   - storage: instance of the {@link DiskStorage}
    ///   - decoder: instance of the {@link JSONDecoder}
    ///   - encoder: instance of the {@link JSONEncoder}
    init(storage: DiskStorage,
         decoder: JSONDecoder = .init(),
         encoder: JSONEncoder = .init()) {
        self.storage = storage;
        self.decoder = decoder;
        self.encoder = encoder;
    }

    
    /// Method which provide the fetch functional
    /// - Parameter key: value
    func fetch<T: Decodable>(for key: String) throws -> T {
        let data = try storage.fetchValue(for: key);
        return try decoder.decode(T.self, from: data);
    }
    
    /// Method which provide the save functional
    /// - Parameters:
    ///   - value: object
    ///   - key: value
    func save<T: Encodable>(_ value: T, for key: String) throws {
        let data = try encoder.encode(value);
        try storage.save(value: data, for: key);
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

import os.log
import Foundation

@propertyWrapper
class Storage<Value: Codable & Equatable> {

    private var documentsDirectory: String? {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }

    private var documentURL: URL? {
        guard let path = documentsDirectory else { return nil }
        return URL(fileURLWithPath: path, isDirectory: true)
            .appendingPathComponent(fileName.rawValue, isDirectory: false)
    }

    private var cache: Cache<Value> = .init(values: [])
    private var fileName: FileName
    private var writingOptions: Data.WritingOptions
    private let fileManager = FileManager.default
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    private let queue = DispatchQueue(label: "FileWritingQueue")

    var wrappedValue: [Value] {
        get {
            return queue.sync {
                if !cache.values.isEmpty {
                    return cache.values
                }
                guard let url = documentURL, fileManager.fileExists(atPath: url.path) else {
                    os_log("Document directory can't be reach to read from", log: OSLog.viewCycle, type: .debug)
                    return []
                }
                do {
                    os_log("Reading file at %@", log: OSLog.viewCycle, type: .debug, url.debugDescription)
                    let data = try Data(contentsOf: url)
                    let decodedData = try decoder.decode([Value].self, from: data)
                    cache = Cache(values: decodedData)
                    return decodedData
                } catch {
                    os_log("Reading file error: %@", log: OSLog.viewCycle, type: .debug, error.localizedDescription)
                    return []
                }
            }
        }
        set {
            queue.sync(flags: .barrier) {
                cache = .init(values: newValue)

                DispatchQueue.global(qos: .background).async { [weak self] in
                    guard let self = self, let url = self.documentURL else {
                        os_log("Document directory can't be reach to writing into", log: OSLog.viewCycle, type: .debug)
                        return
                    }
                    do {
                        os_log("Writing to file at %@", log: OSLog.viewCycle, type: .debug, url.debugDescription)
                        let data = try self.encoder.encode(self.cache)
                        try data.write(to: url, options: self.writingOptions)
                    } catch {
                        os_log("Writing file error: %@", log: OSLog.viewCycle, type: .debug, error.localizedDescription)
                    }
                }
            }
        }
    }

    init(fileName: FileName,
         defaultValue: Cache<Value> = .init(values: []),
         options: Data.WritingOptions = .completeFileProtection) {
        self.fileName = fileName
        self.cache = defaultValue
        self.writingOptions = options
    }

}

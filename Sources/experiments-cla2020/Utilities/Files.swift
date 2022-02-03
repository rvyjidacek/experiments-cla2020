//
//  Files.swift
//  
//
//  Created by Roman Vyjídáček on 01.02.2022.
//

import Foundation

extension FileManager {
    
    public func folderExists(at path: String) -> Bool {
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: path, isDirectory:&isDirectory)
        return exists && isDirectory.boolValue
    }
    
    public func fileExists(at path: String) -> Bool {
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: path, isDirectory:&isDirectory)
        return exists && !(isDirectory.boolValue)
    }
    
    public func createFileIfNotExists(at path: String, content: String) throws {
        if !(fileExists(at: path)) {
            createFile(atPath: path, contents: content.data(using: .utf8), attributes: nil)
        } else {
            try content.write(to: URL(fileURLWithPath: path), atomically: false, encoding: .utf8)
        }
    }
    
    public func createDirectoryIfNotExists(at path: String) throws {
        if !(folderExists(at: path)) {
            try createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    public static func getUrls() throws -> [URL] {
        let path = FileManager.default.currentDirectoryPath + "/datasets"
        
        let urls = try FileManager.default.contentsOfDirectory(at: URL(fileURLWithPath: path, isDirectory: true),
                                                               includingPropertiesForKeys: nil,
                                                               options: [.skipsHiddenFiles]).filter { $0.absoluteString.contains(".fimi") }
        return urls
    }

    public func saveResult(folder: String, filename: String, content: String) throws {
        let folder = currentDirectoryPath + "/results/" + folder
        
        try createDirectoryIfNotExists(at: folder)
        try createFileIfNotExists(at:  folder + "/" + filename, content: content)
    }
    
}

//
//  RKDiskCache+InternalHelpers.swift
//  Lib_Base
//
//  Created by BeyondChao on 2018/10/18.
//  Copyright © 2018 rokid. All rights reserved.
//
//  Reference: https://github.com/saoudrizwan/Disk


import Foundation

extension RKDiskCache {

   public static func createURL(for path: String?, in directory: Directory) throws -> URL {
        let filePrefix = "file://"
        var validPath: String? = nil
        if let path = path {
            do {
                validPath = try getValidFilePath(from: path)
            } catch {
                throw error
            }
        }
        var searchPathDirectory: FileManager.SearchPathDirectory
        switch directory {
        case .documents:
            searchPathDirectory = .documentDirectory
        case .caches:
            searchPathDirectory = .cachesDirectory
        case .applicationSupport:
            searchPathDirectory = .applicationSupportDirectory
        case .temporary:
            if var url = URL(string: NSTemporaryDirectory()) {
                if let validPath = validPath {
                    url = url.appendingPathComponent(validPath, isDirectory: false)
                }
                if url.absoluteString.lowercased().prefix(filePrefix.count) != filePrefix {
                    let fixedUrlString = filePrefix + url.absoluteString
                    url = URL(string: fixedUrlString)!
                }
                return url
            } else {
                throw createError(
                    .couldNotAccessTemporaryDirectory,
                    description: "Could not create URL for \(directory.pathDescription)/\(validPath ?? "")",
                    failureReason: "Could not get access to the application's temporary directory.",
                    recoverySuggestion: "Use a different directory."
                )
            }
        case .sharedContainer(let appGroupName):
            if var url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupName) {
                if let validPath = validPath {
                    url = url.appendingPathComponent(validPath, isDirectory: false)
                }
                if url.absoluteString.lowercased().prefix(filePrefix.count) != filePrefix {
                    let fixedUrl = filePrefix + url.absoluteString
                    url = URL(string: fixedUrl)!
                }
                return url
            } else {
                throw createError(
                    .couldNotAccessSharedContainer,
                    description: "Could not create URL for \(directory.pathDescription)/\(validPath ?? "")",
                    failureReason: "Could not get access to shared container with app group named \(appGroupName).",
                    recoverySuggestion: "Check that the app-group name in the entitlement matches the string provided."
                )
            }
        }
        if var url = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).first {
            if let validPath = validPath {
                url = url.appendingPathComponent(validPath, isDirectory: false)
            }
            if url.absoluteString.lowercased().prefix(filePrefix.count) != filePrefix {
                let fixedUrlString = filePrefix + url.absoluteString
                url = URL(string: fixedUrlString)!
            }
            return url
        } else {
            throw createError(
                .couldNotAccessUserDomainMask,
                description: "Could not create URL for \(directory.pathDescription)/\(validPath ?? "")",
                failureReason: "Could not get access to the file system's user domain mask.",
                recoverySuggestion: "Use a different directory."
            )
        }
    }
    
    /// Find an existing file's URL or throw an error if it doesn't exist
   public static func getExistingFileURL(for path: String?, in directory: Directory) throws -> URL {
        do {
            let url = try createURL(for: path, in: directory)
            if FileManager.default.fileExists(atPath: url.path) {
                return url
            }
            throw createError(
                .noFileFound,
                description: "Could not find an existing file or folder at \(url.path).",
                failureReason: "There is no existing file or folder at \(url.path)",
                recoverySuggestion: "Check if a file or folder exists before trying to commit an operation on it."
            )
        } catch {
            throw error
        }
    }
    
    /// Convert a user generated name to a valid file name
   public static func getValidFilePath(from originalString: String) throws -> String {
        var invalidCharacters = CharacterSet(charactersIn: ":")
        invalidCharacters.formUnion(.newlines)
        invalidCharacters.formUnion(.illegalCharacters)
        invalidCharacters.formUnion(.controlCharacters)
        let pathWithoutIllegalCharacters = originalString
            .components(separatedBy: invalidCharacters)
            .joined(separator: "")
        let validFileName = removeSlashesAtBeginning(of: pathWithoutIllegalCharacters)
        guard validFileName.count > 0  && validFileName != "." else {
            throw createError(
                .invalidFileName,
                description: "\(originalString) is an invalid file name.",
                failureReason: "Cannot write/read a file with the name \(originalString) on disk.",
                recoverySuggestion: "Use another file name with alphanumeric characters."
            )
        }
        return validFileName
    }
    
    /// Helper method for getValidFilePath(from:) to remove all "/" at the beginning of a String
   public static func removeSlashesAtBeginning(of string: String) -> String {
        var string = string
        if string.prefix(1) == "/" {
            string.remove(at: string.startIndex)
        }
        if string.prefix(1) == "/" {
            string = removeSlashesAtBeginning(of: string)
        }
        return string
    }
    
    /// Set 'isExcludedFromBackup' BOOL property of a file or directory in the file system
   public static func setIsExcludedFromBackup(to isExcludedFromBackup: Bool, for path: String?, in directory: Directory) throws {
        do {
            let url = try getExistingFileURL(for: path, in: directory)
            var resourceUrl = url
            var resourceValues = URLResourceValues()
            resourceValues.isExcludedFromBackup = isExcludedFromBackup
            try resourceUrl.setResourceValues(resourceValues)
        } catch {
            throw error
        }
    }
    
    /// Set 'isExcludedFromBackup' BOOL property of a file or directory in the file system
   public static func setIsExcludedFromBackup(to isExcludedFromBackup: Bool, for url: URL) throws {
        do {
            var resourceUrl = url
            var resourceValues = URLResourceValues()
            resourceValues.isExcludedFromBackup = isExcludedFromBackup
            try resourceUrl.setResourceValues(resourceValues)
        } catch {
            throw error
        }
    }
    
    /// Create necessary sub folders before creating a file
   public static func createSubfoldersBeforeCreatingFile(at url: URL) throws {
        do {
            let subfolderUrl = url.deletingLastPathComponent()
            var subfolderExists = false
            var isDirectory: ObjCBool = false
            if FileManager.default.fileExists(atPath: subfolderUrl.path, isDirectory: &isDirectory) {
                if isDirectory.boolValue {
                    subfolderExists = true
                }
            }
            if !subfolderExists {
                try FileManager.default.createDirectory(at: subfolderUrl, withIntermediateDirectories: true, attributes: nil)
            }
        } catch {
            throw error
        }
    }
    
    /// Get Int from a file name
   public static func fileNameInt(_ url: URL) -> Int? {
        let fileExtension = url.pathExtension
        let filePath = url.lastPathComponent
        let fileName = filePath.replacingOccurrences(of: fileExtension, with: "")
        return Int(String(fileName.filter { "0123456789".contains($0) }))
    }
    
    /// Clear directory by removing all files
    ///
    /// - Parameter directory: directory to clear
    /// - Throws: Error if FileManager cannot access a directory
   public static func clear(_ directory: Directory) throws {
        do {
            let url = try createURL(for: nil, in: directory)
            let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
            for fileUrl in contents {
                try? FileManager.default.removeItem(at: fileUrl)
            }
        } catch {
            throw error
        }
    }
    
    /// Remove file from the file system
    ///
    /// - Parameters:
    ///   - path: path of file relative to directory
    ///   - directory: directory where file is located
    /// - Throws: Error if file could not be removed
  public  static func remove(_ path: String, from directory: Directory) throws {
        do {
            let url = try getExistingFileURL(for: path, in: directory)
            try FileManager.default.removeItem(at: url)
        } catch {
            throw error
        }
    }
    
    /// Checks if a file exists
    ///
    /// - Parameters:
    ///   - path: path of file relative to directory
    ///   - directory: directory where file is located
    /// - Returns: Bool indicating whether file exists
   public static func exists(_ path: String, in directory: Directory) -> Bool {
        if let _ = try? getExistingFileURL(for: path, in: directory) {
            return true
        }
        return false
    }
}

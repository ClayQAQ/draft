//
//  RKDiskCache+Error.swift
//  Lib_Base
//
//  Created by BeyondChao on 2018/10/18.
//  Copyright © 2018 rokid. All rights reserved.
//
//  Reference: https://github.com/saoudrizwan/Disk

import UIKit

extension RKDiskCache {
    public enum ErrorCode: Int {
        case noFileFound = 0
        case serialization = 1
        case deserialization = 2
        case invalidFileName = 3
        case couldNotAccessTemporaryDirectory = 4
        case couldNotAccessUserDomainMask = 5
        case couldNotAccessSharedContainer = 6
    }
    
    public static let errorDomain = "DiskErrorDomain"
    
    /// Create custom error that FileManager can't account for
    public  static func createError(_ errorCode: ErrorCode, description: String?, failureReason: String?, recoverySuggestion: String?) -> Error {
        let errorInfo: [String: Any] = [NSLocalizedDescriptionKey : description ?? "",
                                        NSLocalizedRecoverySuggestionErrorKey: recoverySuggestion ?? "",
                                        NSLocalizedFailureReasonErrorKey: failureReason ?? ""]
        return NSError(domain: errorDomain, code: errorCode.rawValue, userInfo: errorInfo) as Error
    }
}

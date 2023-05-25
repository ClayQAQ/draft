//
//  String-MD5.swift
//  rokid
//
//  Created by 朝辉贾 on 15/06/2017.
//  Copyright © 2017 Rokid. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    public var md5: String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        var hash = ""
        for i in 0..<digestLen {
            hash += String(format: "%02x", (result[i]))
        }
        
        result.deallocate()
        
        return hash.uppercased()
    }
}

extension URL {
    public func fileMD5() -> String? {
        do {
            let handle = try FileHandle(forReadingFrom: self)
            
            let ctx = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: MemoryLayout<CC_MD5_CTX>.size)
            
            CC_MD5_Init(ctx)
            var done = false
            while !done {
                let fileData = handle.readData(ofLength: 256)
                fileData.withUnsafeBytes { (bytes) -> Void in
                    CC_MD5_Update(ctx, bytes, CC_LONG(fileData.count))
                }
                if fileData.count == 0 {
                    done = true
                }
            }
            let digestLen = Int(CC_MD5_DIGEST_LENGTH)
            let digest = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
            CC_MD5_Final(digest, ctx)
            var hash = ""
            for i in 0..<digestLen {
                hash += String(format: "%02x", (digest[i]))
            }
            digest.deallocate()
            ctx.deallocate()
            return hash.uppercased()
        } catch {
            return nil
        }
    }
}

//
//  Extension_String_MD5.swift
//  cn
//
//  Created by Mac on 2020/12/22.
//  Copyright © 2020 szq. All rights reserved.
//

import Foundation

import CommonCrypto

public extension String {
    
    // TODO: MD5加密
    ///
    /// print(str.cn_md5())
    ///
    func cn_md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
}

//
//  BasicOperation+Fileable.swift
//  Fileable
//
//  Created by Shota Shimazu on 2017/10/25.
//  Copyright © 2017-2018 Shota Shimazu. All rights reserved.
//

import Foundation

extension Fileable {
    
    public static func cd(_ path: String) throws {
        if !Fileable.fm.changeCurrentDirectoryPath(path) {
            if !Fileable.fm.fileExists(atPath: path) {
                throw FileableError.NotExists
            } else {
                throw FileableError.Unkown("Failed to change current direcotry.")
            }
        }
    }
    
    public static func mkdir(_ path: String) throws {
        try Fileable.fm.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    public func rm() throws {
        try Fileable.fm.removeItem(atPath: self.path)
    }
    
    public func mv(to toPath: String) throws {
        try Fileable.fm.moveItem(atPath: self.path, toPath: toPath)
    }

    public func chmod(mode: Int) throws {
        print("This function is not implemented now.")
    }

    public static func touch(at: String) throws {
        let empty = ""
        do {
            try empty.write(to: URL(string: at)!, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("failed to write: \(error)")
        }
    }
}
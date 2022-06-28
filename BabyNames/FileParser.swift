//
//  FileParser.swift
//  BabyNames
//
//  Created by Josfry Barillas on 6/28/22.
//

import Foundation

struct FileParser {

    
    static func getLines(from fileName: String) -> [String] {
        let mainPath = #file
        var lastPathComponent = mainPath.components(separatedBy: "/").last ?? ""
        let filePath = mainPath.replacingOccurrences(of: lastPathComponent, with: fileName)
        let contents = (try? String(contentsOfFile: filePath, encoding: .utf8)) ?? ""
        var names = contents.components(separatedBy: .newlines)
        names.removeAll(where: { $0.isEmpty })
        
        return names
    }
    
}

//
//  Path.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 16/3/22.
//

import UIKit

class Path: NSCopying {
    
    var positions: [ChessboardPosition] = []
    
    func containsPosition(_ position: ChessboardPosition) -> Bool {
        for thisPosition in self.positions {
            if thisPosition == position {
                return true
            }
        }
        
        return false
    }
    
    func appendPosition(_ position: ChessboardPosition) {
        self.positions.append(position)
    }
    
    func getLastPosition() -> ChessboardPosition? {
        return self.positions.last
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let newPath = Path.init()
        for thisPosition in self.positions {
            newPath.appendPosition(thisPosition)
        }
        return newPath
    }
    
    func getPathChessNotation() -> String? {
        var notationString = ""
        
        var i = 0
        for thisPosition in self.positions {
            notationString.append("\(i + 1). \(thisPosition.getChessNotation()) ")
            i += 1
        }
        
        return notationString
    }
}

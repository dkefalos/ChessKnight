//
//  ChessboardPosition.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardPosition: Equatable, NSCopying {
    
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func isValidPosition(boardSize: Int) -> Bool {
        let hasValidX = (self.x > 0 && self.x <= boardSize)
        let hasValidY = (self.y > 0 && self.y <= boardSize)
        
        return (hasValidX && hasValidY)
    }
    
    func move(x: Int, y: Int) {
        self.x += x
        self.y += y
    }
    
    static func == (lhs: ChessboardPosition, rhs: ChessboardPosition) -> Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let newPos = ChessboardPosition.init(x: self.x, y: self.y)
        return newPos
    }
    
    func getChessNotation() -> String {
        return "\(self.getNotationColumnLetter())\(self.y)"
    }
    
    func getNotationColumnLetter() -> String {
        switch self.x {
        case 1:
            return "a"
        case 2:
            return "b"
        case 3:
            return "c"
        case 4:
            return "d"
        case 5:
            return "e"
        case 6:
            return "f"
        case 7:
            return "g"
        case 8:
            return "h"
        case 9:
            return "i"
        case 10:
            return "j"
        case 11:
            return "k"
        case 12:
            return "l"
        case 13:
            return "m"
        case 14:
            return "n"
        case 15:
            return "o"
        case 16:
            return "p"
        default:
            return ""
        }
    }
}

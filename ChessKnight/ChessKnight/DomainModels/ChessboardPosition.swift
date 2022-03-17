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
}

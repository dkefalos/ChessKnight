//
//  ChessboardPosition.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardPosition: Equatable {
    
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: ChessboardPosition, rhs: ChessboardPosition) -> Bool {
        return (lhs.x == rhs.x && lhs.y == rhs.y)
    }
}

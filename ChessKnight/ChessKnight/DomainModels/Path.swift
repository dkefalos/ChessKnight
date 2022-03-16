//
//  Path.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 16/3/22.
//

import UIKit

class Path {
    var positions: [ChessboardPosition] = []
    
    func containsPosition(_ position: ChessboardPosition) -> Bool {
        for thisPosition in self.positions {
            if thisPosition == position {
                return true
            }
        }
        
        return false
    }
}

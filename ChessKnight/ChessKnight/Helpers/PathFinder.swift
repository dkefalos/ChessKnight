//
//  PathFinder.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 16/3/22.
//

import UIKit

class PathFinder {
    
    static func findPathsFor(chessboardDeps: ChessboardDependencies) -> [Path] {
        
        var paths: [Path] = []
        
        for _ in 1...3 {
            paths.append(PathFinder.createRandomPath(chessboardDeps: chessboardDeps))
        }
        
        return paths
    }
    
    static func createRandomPath(chessboardDeps: ChessboardDependencies) -> Path {
        let path = Path.init()
        for _ in 1...3 {
            path.positions.append(PathFinder.createRandomPosition(chessboardDeps: chessboardDeps))
        }
        
        return path
    }
    
    static func createRandomPosition(chessboardDeps: ChessboardDependencies) -> ChessboardPosition {
        return ChessboardPosition.init(x: Int.random(in: 1..<(chessboardDeps.size + 1)),
                                       y: Int.random(in: 1..<(chessboardDeps.size + 1)))
    }
}

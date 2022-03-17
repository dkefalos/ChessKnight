//
//  PathFinder.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 16/3/22.
//

import UIKit

class PathFinder {
    
    var dependencies: ChessboardDependencies
    
    init(chessboardDeps: ChessboardDependencies) {
        self.dependencies = chessboardDeps
    }
    
    func returnPaths() -> [Path] {
        guard let theStartPosition = self.dependencies.startPosition,
              let theEndPosition = self.dependencies.endPosition else {
            return []
        }
        
        let startPath = Path.init()
        startPath.appendPosition(theStartPosition)
        let firstMovePaths = self.getAllValidNextLevelPathsFor([startPath])
        let secondMovePaths = self.getAllValidNextLevelPathsFor(firstMovePaths)
        let thirdMovePaths = self.getAllValidNextLevelPathsFor(secondMovePaths)
        let correctPaths = self.keepPathsThatEndIn(endPosition: theEndPosition, from: thirdMovePaths)
        
        return correctPaths
    }
    
    func getAllValidNextLevelPathsFor(_ paths: [Path]) -> [Path] {
        var nextLevelPaths: [Path] = []
        
        for thisPath in paths {
            if let lastPos = thisPath.getLastPosition(),
               let endPosition = self.dependencies.endPosition,
               lastPos != endPosition {
                
                let positions = self.createAllPossibleNextPositionsFor(lastPos)
                let validPositions = self.keepValidPositions(positions: positions)
                for thisValidPos in validPositions {
                    if let addedPath = thisPath.copy() as? Path {
                        addedPath.appendPosition(thisValidPos)
                        nextLevelPaths.append(addedPath)
                    }
                }
            }
            else if let lastPos = thisPath.getLastPosition(),
                    let endPosition = self.dependencies.endPosition,
                    lastPos == endPosition {
                nextLevelPaths.append(thisPath)
            }
        }
        
        return nextLevelPaths
    }
    
    func keepPathsThatEndIn(endPosition: ChessboardPosition, from paths: [Path]) -> [Path]{
        var correctPaths: [Path] = []
        
        for thisPath in paths {
            if let lastPosition = thisPath.getLastPosition(), lastPosition == endPosition {
                correctPaths.append(thisPath)
            }
        }
        
        return correctPaths
    }
    
    func createAllPossibleNextPositionsFor(_ position: ChessboardPosition) -> [ChessboardPosition] {

        guard let firstPos = position.copy() as? ChessboardPosition,
              let secondPos = position.copy() as? ChessboardPosition,
              let thirdPos = position.copy() as? ChessboardPosition,
              let forthPos = position.copy() as? ChessboardPosition,
              let fifthPos = position.copy() as? ChessboardPosition,
              let sixthPos = position.copy() as? ChessboardPosition,
              let seventhPos = position.copy() as? ChessboardPosition,
              let eightPos = position.copy() as? ChessboardPosition else {
            return []
        }

        firstPos.move(x: 1, y: 2)
        secondPos.move(x: 2, y: 1)
        thirdPos.move(x: 2, y: -1)
        forthPos.move(x: 1, y: -2)
        fifthPos.move(x: -1, y: -2)
        sixthPos.move(x: -2, y: -1)
        seventhPos.move(x: -2, y: 1)
        eightPos.move(x: -1, y: 2)

        return [firstPos, secondPos, thirdPos, forthPos, fifthPos, sixthPos, seventhPos, eightPos]
    }

    func keepValidPositions(positions: [ChessboardPosition]) -> [ChessboardPosition] {
        var validPositions: [ChessboardPosition] = []

        for thePosition in positions {
            if thePosition.isValidPosition(boardSize: self.dependencies.size) {
                validPositions.append(thePosition)
            }
        }

        return validPositions
    }
}

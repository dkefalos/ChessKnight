//
//  ChessboardCollectionViewCellViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardCollectionViewCellViewModel: SuperCollectionViewCellViewModel {
    
    var chessboardPosition: ChessboardPosition
    var isStartPosition: Bool
    var isEndPosition: Bool
    var isPath: Bool
    
    init(position: ChessboardPosition, isStartPosition: Bool, isEndPosition: Bool, isPath: Bool) {
        self.chessboardPosition = position
        self.isStartPosition = isStartPosition
        self.isEndPosition = isEndPosition
        self.isPath = isPath
    }

    override func updateCell(cell: SuperCollectionViewCell) {
        guard let castedCell = cell as? ChessboardCollectionViewCell else {
            return
        }
        
        switch self.chessboardPosition.x % 2 {
        case 0:
            switch self.chessboardPosition.y % 2 {
            case 0:
                castedCell.cellBackgroundView.backgroundColor = UIColor.white
            default:
                castedCell.cellBackgroundView.backgroundColor = UIColor.black
            }
        default:
            switch self.chessboardPosition.y % 2 {
            case 0:
                castedCell.cellBackgroundView.backgroundColor = UIColor.black
            default:
                castedCell.cellBackgroundView.backgroundColor = UIColor.white
            }
        }
        
        switch self.isStartPosition {
        case true:
            castedCell.cellForegroundView.backgroundColor = UIColor.red.withAlphaComponent(0.9)
            castedCell.cellForegroundView.layer.cornerRadius = 25
        default:
            switch self.isEndPosition {
            case true:
                castedCell.cellForegroundView.backgroundColor = UIColor.yellow.withAlphaComponent(0.9)
                castedCell.cellForegroundView.layer.cornerRadius = 25
            default:
                castedCell.cellForegroundView.backgroundColor = UIColor.clear
            }
        }
    }
    
    override func cellIdentifier() -> String {
        return CellIdentifiers.chessboardBox.rawValue
    }
}

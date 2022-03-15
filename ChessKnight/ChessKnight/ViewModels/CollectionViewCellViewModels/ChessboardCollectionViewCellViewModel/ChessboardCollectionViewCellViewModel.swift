//
//  ChessboardCollectionViewCellViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardCollectionViewCellViewModel: SuperCollectionViewCellViewModel {
    
    var chessboardPosition: ChessboardPosition
    
    init(position: ChessboardPosition) {
        self.chessboardPosition = position
    }

    override func updateCell(cell: SuperCollectionViewCell) {
        guard let castedCell = cell as? ChessboardCollectionViewCell else {
            return
        }
        
        switch chessboardPosition.x % 2 {
        case 0:
            switch chessboardPosition.y % 2 {
            case 0:
                castedCell.cellBackgroundView.backgroundColor = UIColor.white
            default:
                castedCell.cellBackgroundView.backgroundColor = UIColor.black
            }
        default:
            switch chessboardPosition.y % 2 {
            case 0:
                castedCell.cellBackgroundView.backgroundColor = UIColor.black
            default:
                castedCell.cellBackgroundView.backgroundColor = UIColor.white
            }
        }
    }
    
    override func cellIdentifier() -> String {
        return CellIdentifiers.chessboardBox.rawValue
    }
}

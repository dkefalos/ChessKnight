//
//  PathNotationCellViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 17/3/22.
//

import UIKit

class PathNotationCellViewModel: SuperTableViewCellViewModel {
    
    var path: Path
    
    init(path: Path) {
        self.path = path
    }
    
    override func updateCell(cell : SuperTableViewCell) {
        guard let castedCell = cell as? SingleLabelTableViewCell else {
            return
        }
        
        castedCell.cellLabel.text = self.path.getPathChessNotation()
    }
    
    override func cellIdentifier() -> String {
        return CellIdentifiers.singleLabel.rawValue
    }
}

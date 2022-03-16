//
//  ResetButtonViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 16/3/22.
//

import UIKit

class ResetButtonViewModel: SuperTableViewCellViewModel {
    
    var buttonTitle: String?
    var cellButtonDelegate: TableViewCellButtonPressedDelegate?
    
    init(buttonTitle: String?, cellButtonDelegate: TableViewCellButtonPressedDelegate?) {
        self.buttonTitle = buttonTitle
        self.cellButtonDelegate = cellButtonDelegate
    }
    
    override func updateCell(cell : SuperTableViewCell) {
        guard let castedCell = cell as? CellWithButtonTableViewCell else {
            return
        }
        
        castedCell.cellButtonDelegate = self.cellButtonDelegate
        castedCell.cellButton.setTitle(self.buttonTitle, for: UIControl.State())
    }
    
    override func cellIdentifier() -> String {
        return CellIdentifiers.singleButton.rawValue
    }
}

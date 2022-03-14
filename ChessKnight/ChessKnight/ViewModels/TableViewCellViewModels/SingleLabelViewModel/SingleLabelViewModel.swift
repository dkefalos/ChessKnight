//
//  SingleLabelViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

class SingleLabelViewModel: SuperTableViewCellViewModel {
    
    var title: String?
    
    init(title: String?) {
        self.title = title
    }
    
    override func updateCell(cell : SuperTableViewCell) {
        guard let castedCell = cell as? SingleLabelTableViewCell else {
            return
        }
        
        castedCell.cellLabel.text = self.title
    }
    
    override func cellIdentifier() -> String {
        return CellIdentifiers.singleLabel.rawValue
    }
}

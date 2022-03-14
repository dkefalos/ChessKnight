//
//  SuperTableViewCellViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

class SuperTableViewCellViewModel {
    
    func updateCell(cell : SuperTableViewCell) {
        // Must be overriden
    }
    
    func cellIdentifier() -> String {
        // Must be overriden
        return ""
    }
}

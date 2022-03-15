//
//  SuperCollectionViewCellViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class SuperCollectionViewCellViewModel {

    func updateCell(cell: SuperCollectionViewCell) {
        // Must be overriden
    }
    
    func cellIdentifier() -> String {
        // Must be overriden
        return ""
    }
}

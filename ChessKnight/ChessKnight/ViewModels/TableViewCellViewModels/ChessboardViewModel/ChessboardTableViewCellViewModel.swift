//
//  ChessboardTableViewCellViewModel.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardDependencies {
    var size: Int
    var startPosition: ChessboardPosition?
    var endPosition: ChessboardPosition?
    
    init(size: Int, startPosition: ChessboardPosition? = nil, endPosition: ChessboardPosition? = nil) {
        self.size = size
        self.startPosition = startPosition
        self.endPosition = endPosition
    }
}

class ChessboardTableViewCellViewModel: SuperTableViewCellViewModel {
    
    var size: Int
    var dependencies: ChessboardDependencies
    var datasource: ChessboardCollectionViewDatasource?
    var chessboardCellselectedDelegate: ChessboardCellSelectedDelegate?
    
    init(chessboardDeps: ChessboardDependencies, delegate: ChessboardCellSelectedDelegate?) {
        self.size = chessboardDeps.size
        self.dependencies = chessboardDeps
        self.chessboardCellselectedDelegate = delegate
    }
    
    override func updateCell(cell : SuperTableViewCell) {
        guard let castedCell = cell as? ChessboardTableViewCell else {
            return
        }
        
        self.datasource = ChessboardCollectionViewDatasource.init(chessboardDeps: self.dependencies,
                                                                  delegate: self.chessboardCellselectedDelegate)
        castedCell.chessboardCollectionView.dataSource = self.datasource
        castedCell.chessboardCollectionView.delegate = self.datasource
        castedCell.chessboardCollectionView.reloadData()
    }
    
    override func cellIdentifier() -> String {
        return CellIdentifiers.chessboard.rawValue
    }
}

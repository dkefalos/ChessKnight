//
//  ChessboardModels.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

enum ChessboardModels {

    class DataModel {
        
        var boardSize: Int
        var chessboardDependencies: ChessboardDependencies
        
        init(boardSize: Int) {
            self.boardSize = boardSize
            self.chessboardDependencies = ChessboardDependencies.init(size: self.boardSize)
        }
    }
    
    class ViewModel: TableViewDatasource {
        
        init(dataModel: DataModel?, delegate: ChessboardCellSelectedDelegate?) {
            super.init()
            self.constructCells(dataModel: dataModel, delegate: delegate)
        }
        
        func constructCells(dataModel: DataModel?, delegate: ChessboardCellSelectedDelegate?) {
            let labelCell = SingleLabelViewModel.init(title: "Please select a starting and an ending position for your knight")
            self.cells.append(labelCell)
            
            if let boardDeps = dataModel?.chessboardDependencies {
                let chessboardCell = ChessboardTableViewCellViewModel.init(chessboardDeps: boardDeps, delegate: delegate)
                self.cells.append(chessboardCell)
            }
        }
    }
}

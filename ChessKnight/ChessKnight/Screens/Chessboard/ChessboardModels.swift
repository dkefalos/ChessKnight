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
        
        func updateWithStartPosition(_ position: ChessboardPosition) {
            self.chessboardDependencies.startPosition = position
        }
        
        func updateWithEndPosition(_ position: ChessboardPosition) {
            self.chessboardDependencies.endPosition = position
            let pathfinder = PathFinder.init(chessboardDeps: self.chessboardDependencies)
            self.chessboardDependencies.paths = pathfinder.returnPaths() // .findPathsFor(chessboardDeps: self.chessboardDependencies)
        }
        
        func doesNotContainStartPosition() -> Bool {
            return self.chessboardDependencies.startPosition == nil
        }
        
        func doesNotContainEndPosition() -> Bool {
            return self.chessboardDependencies.endPosition == nil
        }
        
        func shouldShowResetButton() -> Bool {
            return self.chessboardDependencies.startPosition != nil
        }
        
        func clearResetableData() {
            self.chessboardDependencies.startPosition = nil
            self.chessboardDependencies.endPosition = nil
            self.chessboardDependencies.paths = []
        }
    }
    
    class ViewModel: TableViewDatasource {
        
        init(dataModel: DataModel?,
             chessboardDelegate: ChessboardCellSelectedDelegate?,
             cellButtonDelegate: TableViewCellButtonPressedDelegate?) {
            
            super.init()
            self.constructCells(dataModel: dataModel,
                                chessboardDelegate: chessboardDelegate,
                                cellButtonDelegate: cellButtonDelegate)
        }
        
        func constructCells(dataModel: DataModel?,
                            chessboardDelegate: ChessboardCellSelectedDelegate?,
                            cellButtonDelegate: TableViewCellButtonPressedDelegate?) {

            self.constructLabelCell()
            self.constructChessboardCell(dataModel: dataModel, chessboardDelegate: chessboardDelegate)
            if let theDataModel = dataModel, theDataModel.shouldShowResetButton() {
                self.contructResetCell(dataModel: dataModel, resetDelegate: cellButtonDelegate)
            }
        }
        
        func constructLabelCell() {
            let labelCell = SingleLabelViewModel.init(title: "Please select a starting and an ending position for your knight")
            self.cells.append(labelCell)
        }
        
        func constructChessboardCell(dataModel: DataModel?, chessboardDelegate: ChessboardCellSelectedDelegate?) {
            if let boardDeps = dataModel?.chessboardDependencies {
                let chessboardCell = ChessboardTableViewCellViewModel.init(chessboardDeps: boardDeps,
                                                                           delegate: chessboardDelegate)
                self.cells.append(chessboardCell)
            }
        }
        
        func contructResetCell(dataModel: DataModel?, resetDelegate: TableViewCellButtonPressedDelegate?) {
            let resetCell = ResetButtonViewModel.init(buttonTitle: "Reset", cellButtonDelegate: resetDelegate)
            self.cells.append(resetCell)
        }
    }
}

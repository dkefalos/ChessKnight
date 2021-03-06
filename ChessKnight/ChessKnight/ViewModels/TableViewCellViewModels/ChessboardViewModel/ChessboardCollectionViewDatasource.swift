//
//  ChessboardCollectionViewDatasource.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardCollectionViewDatasource: NSObject,
                                          UICollectionViewDelegate,
                                          UICollectionViewDataSource,
                                          UICollectionViewDelegateFlowLayout {
    
    var boardSize: Int
    var cells: [SuperCollectionViewCellViewModel] = []
    var chessboardCellSelectedDelegate: ChessboardCellSelectedDelegate?
    
    init(chessboardDeps: ChessboardDependencies, delegate: ChessboardCellSelectedDelegate?) {
        self.boardSize = chessboardDeps.size
        super.init()
        self.chessboardCellSelectedDelegate = delegate
        
        self.createCells(chessboardDeps: chessboardDeps)
    }
    
    func createCells(chessboardDeps: ChessboardDependencies) {
        
        for i in 1...chessboardDeps.size {
            for j in 1...chessboardDeps.size {
                let position = ChessboardPosition.init(x: i, y: j)
                
                let isStartPosition = self.isStartPosition(position: position, chessboardDeps: chessboardDeps)
                let isEndPosition = self.isEndPosition(position: position, chessboardDeps: chessboardDeps)
                let isPath = self.isPath(position: position, chessboardDeps: chessboardDeps)
                
                let newCell = ChessboardCollectionViewCellViewModel.init(position: position,
                                                                         isStartPosition: isStartPosition,
                                                                         isEndPosition: isEndPosition,
                                                                         isPath: isPath)
                self.cells.append(newCell)
            }
        }
    }
    
    func isStartPosition(position: ChessboardPosition, chessboardDeps: ChessboardDependencies) -> Bool {
        if let startPos = chessboardDeps.startPosition {
            if startPos == position {
                return true
            }
        }
        
        return false
    }
    
    func isEndPosition(position: ChessboardPosition, chessboardDeps: ChessboardDependencies) -> Bool {
        if let endPos = chessboardDeps.endPosition {
            if endPos == position {
                return true
            }
        }
        
        return false
    }
    
    func isPath(position: ChessboardPosition, chessboardDeps: ChessboardDependencies) -> Bool {
        for thisPath in chessboardDeps.paths {
            if thisPath.containsPosition(position) {
                return true
            }
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boardSize*boardSize
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.cells.count >= indexPath.row {
            let cellViewModel = cells[indexPath.row]
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellViewModel.cellIdentifier(), for: indexPath) as? SuperCollectionViewCell {
                cellViewModel.updateCell(cell: cell)
                
                return cell
            }
        }
        
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/CGFloat(self.boardSize),
                      height: collectionView.frame.height/CGFloat(self.boardSize))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.cells.count >= indexPath.row {
            let cellViewModel = cells[indexPath.row]
            
            if let chessboardCellViewModel = cellViewModel as? ChessboardCollectionViewCellViewModel {
                let selectedPosition = chessboardCellViewModel.chessboardPosition
                self.chessboardCellSelectedDelegate?.selectedCellAt(selectedPosition)
            }
        }
    }
}

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
    
    init(chessboardDeps: ChessboardDependencies) {
        self.boardSize = chessboardDeps.size
        
        for i in 1...boardSize {
            for j in 1...boardSize {
                let position = ChessboardPosition.init(x: i, y: j)
                self.cells.append(ChessboardCollectionViewCellViewModel.init(position: position))
            }
        }
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
}

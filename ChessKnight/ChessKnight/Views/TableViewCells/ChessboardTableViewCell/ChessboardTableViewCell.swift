//
//  ChessboardTableViewCell.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 15/3/22.
//

import UIKit

class ChessboardTableViewCell: SuperTableViewCell {

    @IBOutlet weak var chessboardCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.chessboardCollectionView.register(UINib.init(nibName: NibNames.chessboardBox.rawValue, bundle: nil),
                                               forCellWithReuseIdentifier: CellIdentifiers.chessboardBox.rawValue)
        self.chessboardCollectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//
//  CellWithButtonTableViewCell.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 16/3/22.
//

import UIKit

class CellWithButtonTableViewCell: SuperTableViewCell {

    @IBOutlet weak var cellButton: UIButton!
    var cellButtonDelegate: TableViewCellButtonPressedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cellButtonPressed(_ sender: UIButton) {
        self.cellButtonDelegate?.cellButtonPressed(id: nil)
    }
}

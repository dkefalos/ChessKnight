//
//  LaunchScreenViewController.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

class LaunchScreenViewController: SuperViewController {
    
    @IBOutlet weak var chooseSizeLabel: UILabel!
    @IBOutlet weak var chessboardSizeTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var knightImageView: UIImageView!
    
    override func customizeView() {
        self.navigationItem.title = "ChessKnight"
        self.chooseSizeLabel.text = "Please select the size of the chessboard"
        self.chessboardSizeTextfield.text = "8"
        self.chessboardSizeTextfield.keyboardType = .numberPad
        self.submitButton.setTitle("Submit", for: UIControl.State())
        self.knightImageView.image = UIImage(named: "knightImage")
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        guard let chessboardSize = self.chessboardSizeTextfield.text,
              let theChessboardSize = Int(chessboardSize) else {
            return
        }
        
        debugPrint("Chessboard size: \(theChessboardSize)")
        self.createChessboardViewController(boardSize: theChessboardSize)
    }
    
    func createChessboardViewController(boardSize: Int) {
        let dataModel = ChessboardModels.DataModel.init(boardSize: boardSize)
        let vc = ChessboardViewController.init(dataModel: dataModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

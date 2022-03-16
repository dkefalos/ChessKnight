//
//  ChessboardViewController.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

protocol ChessboardCellSelectedDelegate {
    func selectedCellAt(_ position: ChessboardPosition)
}

class ChessboardViewController: SuperTableViewController, ChessboardCellSelectedDelegate {
    
    var dataModel: ChessboardModels.DataModel?
    var tableViewModel: ChessboardModels.ViewModel?
    
    init(dataModel: ChessboardModels.DataModel) {
        super.init(nibName: "ChessboardViewController", bundle: nil)
        self.dataModel = dataModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentData()
    }
    
    func presentData() {
        self.tableViewModel = ChessboardModels.ViewModel.init(dataModel: self.dataModel, delegate: self)
        self.updateWithViewModel(self.tableViewModel)
    }
    
    func selectedCellAt(_ position: ChessboardPosition) {
        debugPrint("Selected Cell at Position x: \(position.x), y: \(position.y)")
        self.dataModel?.updateWithStartPosition(position)
        self.presentData()
    }
}

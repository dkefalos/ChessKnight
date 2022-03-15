//
//  ChessboardViewController.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

class ChessboardViewController: SuperTableViewController {
    
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
        self.tableViewModel = ChessboardModels.ViewModel.init(dataModel: self.dataModel)
        self.updateWithViewModel(self.tableViewModel)
    }
}

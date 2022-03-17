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

protocol TableViewCellButtonPressedDelegate {
    func cellButtonPressed(id: String?)
}

class ChessboardViewController: SuperTableViewController, ChessboardCellSelectedDelegate, TableViewCellButtonPressedDelegate {
    
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
    
    override func customizeView() {
        self.navigationItem.title = "ChessboardViewController"
    }
    
    func presentData() {
        self.tableViewModel = ChessboardModels.ViewModel.init(dataModel: self.dataModel,
                                                              chessboardDelegate: self,
                                                              cellButtonDelegate: self)
        self.updateWithViewModel(self.tableViewModel)
    }
    
    func selectedCellAt(_ position: ChessboardPosition) {
        
        guard let theDataModel = self.dataModel else {
            return
        }
        
        if theDataModel.doesNotContainStartPosition() {
            self.dataModel?.updateWithStartPosition(position)
            self.presentData()
        }
        else if theDataModel.doesNotContainEndPosition() {
            self.dataModel?.updateWithEndPosition(position)
            self.presentData()
            if theDataModel.hasNoValidResultPaths() {
                AlertsHelper.createAlert(title: "ChessKnight",
                                         message: "There are no available results for the positions you entered",
                                         viewController: self)
            }
        }
    }
    
    func cellButtonPressed(id: String?) {
        self.dataModel?.clearResetableData()
        self.presentData()
    }
}

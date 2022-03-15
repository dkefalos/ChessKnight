//
//  SuperTableViewController.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

class SuperTableViewController: SuperViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
    }
    
    func registerCells() {
        self.tableView.register(UINib.init(nibName: NibNames.singleLabel.rawValue, bundle: nil),
                                forCellReuseIdentifier: CellIdentifiers.singleLabel.rawValue)
        self.tableView.register(UINib.init(nibName: NibNames.chessboad.rawValue, bundle: nil),
                                forCellReuseIdentifier: CellIdentifiers.chessboard.rawValue)
    }
    
    func updateWithViewModel(_ viewModel: TableViewDatasource?) {
        DispatchQueue.main.async {
            self.tableView.dataSource = viewModel
            self.tableView.reloadData()
        }
    }
    
    override func customizeView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.tableHeaderView = UIView()
    }
}

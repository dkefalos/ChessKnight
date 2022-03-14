//
//  TableViewDatasource.swift
//  ChessKnight
//
//  Created by Dimitris Kefalos on 14/3/22.
//

import UIKit

class TableViewDatasource: NSObject, UITableViewDataSource {
    
    var cells: [SuperTableViewCellViewModel] = []
    
    func viewModel(at indexPath: IndexPath) -> SuperTableViewCellViewModel? {
        if self.cells.isEmpty == false, self.cells.count >= indexPath.row {
            return self.cells[indexPath.row]
        }
        return nil
    }
    
    
    // MARK: - TableView Datasource Protocol Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if cells.isEmpty == false {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = self.viewModel(at: indexPath) else {
            return UITableViewCell.init()
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier()) as? SuperTableViewCell {
        
            cellViewModel.updateCell(cell: cell)
            return cell
        }
        
        return UITableViewCell.init()
    }
}

//
//  SavedViewController.swift
//  Kream
//
//  Created by 선가연 on 10/13/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModel.savedDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        savedView.updateCellCount(with: data.count)
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        
        view.tableView.dataSource = self
        view.tableView.dataSource = self
        
        return view
    }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}

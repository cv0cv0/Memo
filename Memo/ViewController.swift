//
//  ViewController.swift
//  Memo
//
//  Created by 关蕤 on 2019/3/11.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit
import LeanCloud

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    private let dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    
    private func loadData() {
        let query = LCQuery(className: "Cell")
        _ = query.find { result in
            switch result {
            case .success(let objects):
                self.dataArray.addObjects(from: objects)
                self.tableView.reloadData()
                break
            case .failure(let error):
                NSLog("-> %@", error.localizedDescription)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "table_cell")
        let object = dataArray[indexPath.row] as! LCObject
        tableCell?.textLabel?.text = object.get("text")?.stringValue
        return tableCell!
    }
}

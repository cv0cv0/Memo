//
//  TableViewCell.swift
//  Memo
//
//  Created by 关蕤 on 2019/3/12.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit
import LeanCloud

class TableViewCell: UITableViewCell {
    var cell: LCObject? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

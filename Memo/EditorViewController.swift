//
//  EditorViewController.swift
//  Memo
//
//  Created by 关蕤 on 2019/3/12.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit
import LeanCloud

class EditorViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onCompleteClick(_ sender: UIBarButtonItem) {
        let cell = LCObject(className: "Cell")
        cell.set("text", value: textView.text)
        _ = cell.save { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                NSLog("-> %@", error.localizedDescription)
            }
        }
    }
}

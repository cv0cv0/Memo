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
    
    private let completeButton = UIBarButtonItem()
    private var deleteButton: UIBarButtonItem? = nil
    
    var cell: LCObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeButton.title = "完成"
        completeButton.action = #selector(onCompleteClick)
        
        if cell != nil {
            textView.text = cell?.get("text")?.stringValue
            
            deleteButton = UIBarButtonItem()
            deleteButton?.title = "删除"
            deleteButton?.action = #selector(onDeleteClick)
            navigationItem.setRightBarButtonItems([completeButton, deleteButton!], animated: false)
        } else {
            navigationItem.setRightBarButton(completeButton, animated: false)
        }
    }
    
    @objc private func onCompleteClick() {
        if cell == nil {
            cell = LCObject(className: "Cell")
        }
        cell?.set("text", value: textView.text)
        _ = cell?.save { result in
            switch result {
            case .success:
                self.navigationController?.popViewController(animated: true)
                break
            case .failure(let error):
                NSLog("-> %@", error.localizedDescription)
            }
        }
    }
    
    @objc private func onDeleteClick() {
        _ = cell?.delete { result in
            switch result {
            case .success:
                self.navigationController?.popViewController(animated: true)
                break
            case .failure(let error):
                NSLog("-> %@", error.localizedDescription)
            }
        }
    }
}

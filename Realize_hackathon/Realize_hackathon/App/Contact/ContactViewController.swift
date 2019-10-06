//
//  ContactViewController.swift
//  Realize_hackathon
//
//  Created by Adriano Ramos on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var labelsView: UIView!
    
    @IBOutlet weak var numberField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberField.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: NotificationCenter) {
        self.labelsView.frame.size.height = -70
    }
}

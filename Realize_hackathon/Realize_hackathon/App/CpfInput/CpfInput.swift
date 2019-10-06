//
//  CpfInput.swift
//  Realize_hackathon
//
//  Created by Adriano Ramos on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class CpfInput: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.becomeFirstResponder()
    }
    
}

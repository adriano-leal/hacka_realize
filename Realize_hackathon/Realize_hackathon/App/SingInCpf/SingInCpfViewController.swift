//
//  SingInCpfViewController.swift
//  Realize_hackathon
//
//  Created by Guilherme Rangel on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class SingInCpfViewController: UIViewController {

    @IBOutlet weak var labelsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        
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
          self.labelsView.frame.size.height = -39
      }

    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "2 de 5", style: .plain , target: nil, action: nil)
         self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
         
     }
}

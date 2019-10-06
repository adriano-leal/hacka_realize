//
//  LoginViewController.swift
//  Realize_hackathon
//
//  Created by Adriano Ramos on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cpfField: HoshiTextField! {
        didSet {
            cpfField.setCPFIcon(#imageLiteral(resourceName: "cpf"))
        }
    }
    
    @IBOutlet weak var labelsView: UIView!
    @IBOutlet weak var lblCpf: UILabel!
    
    @IBOutlet weak var requestCardButtonAction: UIButton!
    @IBOutlet weak var requestCardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        cpfField.delegate = self

        lblCpf.isHidden = false
        cpfField.backgroundColor = .black
        cpfField.textColor = .white
        cpfField.borderInactiveColor = .lightGray
        cpfField.borderActiveColor = .white
        cpfField.tag = 25
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification , object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification , object: nil)

        
//        cpfField.addTarget(self, action: #selector(hideCpf), for: .editingDidBegin)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = false
//    }
    
//    @objc func hideCpf() {
//        lblCpf.isHidden = true
//    }
    
    @objc func keyboardWillChange(notification: NotificationCenter) {
        self.labelsView.frame.size.height = -60
    }
    
//    @objc func DismissKeyboard(){ view.endEditing(true) }
    
//    func hideKeyboard() {
//        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
//        view.addGestureRecognizer(tap)
//    }
    
}


extension UITextField {
    func setCPFIcon(_ image: UIImage) {
        let cpfIcon = UIImageView(frame: CGRect(x: 10, y: 5, width: 23, height: 23))
        cpfIcon.image = image
        
        let cpfViewContainer: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        cpfViewContainer.addSubview(cpfIcon)
        leftView = cpfViewContainer
        leftViewMode = .always
    }
}



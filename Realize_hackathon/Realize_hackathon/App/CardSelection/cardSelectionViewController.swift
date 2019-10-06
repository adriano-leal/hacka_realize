//
//  cardSelectionViewController.swift
//  Realize_hackathon
//
//  Created by Guilherme Rangel on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class cardSelectionViewController: UIViewController {

    @IBOutlet weak var viewCard: UIView!
    
    @IBOutlet weak var btnRequest: UIButton!
    @IBAction func btnRequest(_ sender: UIButton) {
        print("next")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        viewCard.layer.cornerRadius = 15
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Ajuda", style: .done, target: self, action: nil)
    }

}

//
//  identityViewController.swift
//  Realize_hackathon
//
//  Created by Guilherme Rangel on 06/10/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class identityViewController: UIViewController {
    
    weak var imgIdentifyFront: UIImage?
    weak var imgIdentifyBack: UIImage?
    @IBOutlet weak var btnConfirmIdentify: UIButton!
    
    @IBAction func btnConfirmIndentify(_ sender: UIButton) {
        print("nextPhone")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODOs - Abrir camera e guardar imagem

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

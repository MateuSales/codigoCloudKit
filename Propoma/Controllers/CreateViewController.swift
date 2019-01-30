//
//  CreateViewController.swift
//  Propoma
//
//  Created by Alysson Moreira on 30/01/19.
//  Copyright © 2019 Mateus Sales. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var tvContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapBbiCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapBbiSave(_ sender: Any) {
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

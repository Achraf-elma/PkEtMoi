//
//  AjoutActiviteViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 25/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class AjoutActiviteViewController: UIViewController {

    @IBOutlet weak var nomActivitéTF: UITextField!
    var nouvelleActivite : ActiviteModel?
    
    @IBAction func ajoutActivite(_ sender: UIButton) {
        if nomActivitéTF.text != nil{
            nouvelleActivite=ActiviteModel(nom:nomActivitéTF.text!,niveau:0,experience:0)
        self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

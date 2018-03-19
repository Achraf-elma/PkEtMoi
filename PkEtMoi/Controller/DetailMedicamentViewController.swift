//
//  DetailMedicamentViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class DetailMedicamentViewController: UIViewController ,isAbleToReceiveData {
    func pass(data: String) {
        print(data)
    }

    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var nomLabel: UILabel!
    
    var nomMedicament : String = ""
    var descriptionMedicament: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = self.nomMedicament
        self.nomLabel.text = self.descriptionMedicament
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addAlarm(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "alarme") as! AlarmViewController
        myVC.delegate = self
        navigationController?.pushViewController(myVC, animated: true)
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

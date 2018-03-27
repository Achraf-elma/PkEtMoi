//
//  EtatViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 26/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class EtatViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    var etat = ["ON","OFF","DYSKINESIES"]
    var selectedValue:Int = 0
    
    @IBOutlet weak var etats: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        etats.delegate = self
        etats.dataSource = self
    }

    @IBAction func valider(_ sender: UIButton) {
    AbstractDAO.getDAO()?._getSyntheseDAO()?._getCurrentSynthese()?.addEtat(date: Date(), result: etat[selectedValue])
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (etat.count)
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String!{
        return etat[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = etats.selectedRow(inComponent: component)
    }

}

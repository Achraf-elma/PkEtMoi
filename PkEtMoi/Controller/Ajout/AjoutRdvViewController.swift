//
//  AjoutRdvViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 25/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class AjoutRdvViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{

    

    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var prenom: UITextField!
    @IBOutlet weak var specialite: UIPickerView!
    @IBOutlet weak var adresse: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var telephone: UITextField!
    var selectedValue :Int = 0
    var nouveauRDV : RdvModel?
    var specialites : SpecialiteSet!
    
    @IBAction func ajoutRDV(_ sender: UIButton) {
        if (nom.text?.isEmpty)!{
            nom.backgroundColor = UIColor.red
            return
        }
        if (prenom.text?.isEmpty)!{
            prenom.backgroundColor = UIColor.red
            return
        }
        if (adresse.text?.isEmpty)!{
            adresse.backgroundColor = UIColor.red
            return
        }
        if (telephone.text?.isEmpty)!{
            telephone.backgroundColor = UIColor.red
            return
        }
        nouveauRDV = RdvModel(firstname:prenom.text!, lastname:nom.text!,adresse:adresse.text!,date:date.date,telephone:telephone.text!,type:(specialites.get(i: selectedValue)?.nom)!)
        var currentDate = date.date
        currentDate.addTimeInterval(-86400)
        AppDelegate.notification.addNotification(title: "Rdv", body: (nouveauRDV?.fullname)!, date:currentDate , identifier: "rdv" + DateHandler.toString(date: currentDate))
        nouveauRDV?.addAlarme(date: currentDate)
        currentDate.addTimeInterval(82800)
        AppDelegate.notification.addNotification(title: "Rdv", body: (nouveauRDV?.fullname)!, date: currentDate, identifier: "rdv" + DateHandler.toString(date: currentDate))
        nouveauRDV?.addAlarme(date: currentDate)
        if (specialites.get(i: selectedValue)?.nom)! == "Neurologue"{
            SyntheseModel(debut: 8, fin: 18, rdv: nouveauRDV!)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return specialites.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        specialite?.delegate = self
        specialite?.dataSource = self
        self.specialites = AbstractDAO.getDAO()?._getSpecialiteDAO()?._getAll()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String?{
        return specialites.get(i: row)?.nom
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = specialite.selectedRow(inComponent: component)
    }

}

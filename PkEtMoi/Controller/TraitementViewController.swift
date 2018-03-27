//
//  TraitementViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 27/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class TraitementViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {


    var medicament : MedicamentSet = (AbstractDAO.getDAO()?._getMedicamentDAO()?._getAll())!
    
    var selectedMedicament : Int = 0
    var selectedDosage : Int = 0
    
    var dosages : [Int] = []
    
    @IBOutlet weak var medicamentPicker: UIPickerView!
    @IBOutlet weak var dosagePicker: UIPickerView!
    @IBOutlet weak var dateDebutPicker: UIDatePicker!
    @IBOutlet weak var dateFinPicker: UIDatePicker!
    @IBOutlet weak var xPrisesLabel: UILabel!
    
    @IBAction func valider(_ sender: UIButton) {
        if dateFinPicker.date.timeIntervalSince(dateDebutPicker.date) > 0{
            var dates : [DateHandler] = []
            var currentDate = DateHandler(date: dateDebutPicker.date, formatter: "MMM dd, yyyy")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
            if stepperOutlet.value == 1{
                var date = dateFormatter.date(from: currentDate.currentDate + " 15:00")
                dates.append(DateHandler(date: date!,formatter: "MMM dd, yyyy HH:mm"))
            }
            else if stepperOutlet.value == 2{
                var date = dateFormatter.date(from: currentDate.currentDate + " 12:00")
                dates.append(DateHandler(date: date!,formatter: "MMM dd, yyyy HH:mm"))
                date = dateFormatter.date(from: currentDate.currentDate + " 17:00")
                dates.append(DateHandler(date: date!,formatter: "MMM dd, yyyy HH:mm"))
            }
            else{
                var date = dateFormatter.date(from: currentDate.currentDate + " 09:00")
                dates.append(DateHandler(date: date!,formatter: "MMM dd, yyyy HH:mm"))
                date = dateFormatter.date(from: currentDate.currentDate + " 13:00")
                dates.append(DateHandler(date: date!,formatter: "MMM dd, yyyy HH:mm"))
                date = dateFormatter.date(from: currentDate.currentDate + " 17:00")
                dates.append(DateHandler(date: date!,formatter: "MMM dd, yyyy HH:mm"))
            }
            for index in 1...Int(round(dateFinPicker.date.timeIntervalSince(dateDebutPicker.date) / 86400)){
                for date in dates{
                    medicament.get(i: selectedMedicament)?.addAlarme(date: date.date)
                    date.nextDay()
                }
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBAction func stepper(_ sender: UIStepper) {
        xPrisesLabel.text = " " + String(describing:Int(stepperOutlet.value)) + " "
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperOutlet.maximumValue = 3
        stepperOutlet.minimumValue = 1
        xPrisesLabel.text = " " + String(describing:Int(stepperOutlet.value)
            ) + " "
        medicamentPicker.dataSource = self
        medicamentPicker.delegate = self
        
        dosagePicker.dataSource = self
        dosagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == medicamentPicker{
            return medicament.count
        }
        else{
            return (medicament.get(i: selectedMedicament)?.doses.count)!
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String?{
        if pickerView == medicamentPicker{
            return medicament.get(i: row)?.nom
        }
        else{
            return String(describing: medicament.get(i: selectedMedicament)?.doses[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == medicamentPicker{
            selectedMedicament = medicamentPicker.selectedRow(inComponent: component)
            medicamentPicker.reloadAllComponents()
            dosagePicker.reloadAllComponents()
        }
        else{
            selectedDosage = dosagePicker.selectedRow(inComponent: component)
            medicamentPicker.reloadAllComponents()
            dosagePicker.reloadAllComponents()
        }
    }

}

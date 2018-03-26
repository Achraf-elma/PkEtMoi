//
//  DetailMedicamentViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class DetailMedicamentViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,isAbleToReceiveAlarm {


    func pass(nom:String,date: Date) {
        medicament.addAlarme(date: date)
        AppDelegate.notification.addNotification(title: "Prise", body: (medicament.nom)! + " " + String(medicament.doses[selectedValue]), date: date, identifier: "medicament" + DateHandler.toString(date: date))
        alarmeTable.reloadData()
    }
    
    var medicament : MedicamentModel = MedicamentModel()
    
    @IBOutlet weak var alarmeTable: UITableView!
    
    var selectedValue :Int = 0
    @IBOutlet weak var dosages: UIPickerView!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var nomLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        alarmeTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = medicament.description
        self.nomLabel.text = medicament.nom
        alarmeTable?.delegate = self
        alarmeTable?.dataSource = self
        
        self.dosages.delegate = self
        self.dosages.dataSource = self
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.medicament.alarmes!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.alarmeTable.dequeueReusableCell(withIdentifier: "medicamentDetail", for: indexPath) as! MedicamentDetailTableViewCell
        let text : DateHandler = DateHandler(date: (self.medicament.alarmes!.get(i: indexPath.row)!.date)! , formatter: "MMM dd, yyyy HH:mm")
        cell.labelCell.text = text.currentDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            var date = (self.medicament.alarmes?.get(i: indexPath.row)?.date)!
            AppDelegate.notification.removeNotification(identifier: ["medicament"+DateHandler.toString(date: date)])
            self.medicament.deleteAlarme(date:date)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (medicament.doses.count)
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String!{
        let value : Int = medicament.doses[row]
        return String(describing: value)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedValue = dosages.selectedRow(inComponent: component)
    }

}

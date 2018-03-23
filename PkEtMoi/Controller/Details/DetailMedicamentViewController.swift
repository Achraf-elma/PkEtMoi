//
//  DetailMedicamentViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class DetailMedicamentViewController: UIViewController,UITableViewDataSource, UITableViewDelegate ,isAbleToReceiveAlarm {
    
    func pass(nom:String,date: Date) {
        medicament?.addAlarme(date: date)
        alarmeTable.reloadData()
    }
    
    var medicament : MedicamentModel? = nil
    
    @IBOutlet weak var alarmeTable: UITableView!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var nomLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        alarmeTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionLabel.text = medicament?.description
        self.nomLabel.text = medicament?.nom
        alarmeTable?.delegate = self
        alarmeTable?.dataSource = self
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
        return (self.medicament?.alarmes!.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.alarmeTable.dequeueReusableCell(withIdentifier: "medicamentDetail", for: indexPath) as! MedicamentDetailTableViewCell
        let text : DateHandler = DateHandler(date: (self.medicament?.alarmes!.get(i: indexPath.row)!.date)! , formatter: "MMM dd, yyyy HH:mm")
        print(text.currentDate)
        cell.labelCell.text = text.currentDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.medicament?.deleteAlarme(date:(self.medicament?.alarmes?.get(i: indexPath.row)?.date)!)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

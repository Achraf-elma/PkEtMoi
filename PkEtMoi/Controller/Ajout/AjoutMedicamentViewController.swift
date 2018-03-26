//
//  AjoutMedicamentViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 25/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class AjoutMedicamentViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var doses : [Int] = []
    @IBOutlet weak var dosage: UITextField!
    @IBOutlet weak var presentation: UITextField!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.reloadData()
    }

    @IBAction func ajouter(_ sender: UIButton) {
        var value:Int? = Int(dosage.text!)
        if value != nil{
            doses.append(value!)
            table.reloadData()
        }
    }
    @IBAction func ajouterMedicament(_ sender: UIButton) {
        MedicamentModel(nom: nom.text!, description: presentation.text!, dosage: doses)
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var ajouterMedicament: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table?.dequeueReusableCell(withIdentifier: "ajoutMed", for: indexPath) as! AjoutMedicamentTableViewCell
        cell.label.text = String(doses[indexPath.row])
        return cell
    }
    

}

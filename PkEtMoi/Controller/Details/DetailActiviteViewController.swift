//
//  DetailActiviteViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class DetailActiviteViewController: UIViewController,UITableViewDataSource, UITableViewDelegate ,isAbleToReceiveAlarm {
    
    func pass(nom:String,date: Date) {
        activite?.addAlarme(date: date)
        alarmeTable.reloadData()
    }
    

    @IBOutlet weak var nomActivite: UILabel!
    
    var activite :ActiviteModel? = nil
    
    @IBOutlet weak var activiteTable: UITableView!
    @IBOutlet weak var alarmeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomActivite.text = activite?.nom
        alarmeTable.delegate = self
        alarmeTable.dataSource = self
        
        activiteTable.delegate = self
        activiteTable.dataSource = self
    }
    
    @IBAction func jeViensDenFaire(_ sender: UIButton) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        alarmeTable.reloadData()
        activiteTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addAlarm(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let myVC = storyboard.instantiateViewController(withIdentifier: "alarme") as! AlarmViewController
        myVC.delegate = self
        navigationController?.pushViewController(myVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.alarmeTable {
            return (self.activite?.alarmes.count)!
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.alarmeTable {
            let cell = self.alarmeTable.dequeueReusableCell(withIdentifier: "activiteAlarmeCell", for: indexPath) as! ActiviteDetailAlarmeTableViewCell
            var text : DateHandler = DateHandler(date: (self.activite?.alarmes[indexPath.row].date)! as! Date, formatter: "MMM dd, yyyy HH:mm")
            cell.labelCell.text = text.currentDate
            return cell
        }
        else if tableView == self.activiteTable{
            let cell = self.activiteTable.dequeueReusableCell(withIdentifier: "activiteCell", for: indexPath) as! ActivitePerformanceTableViewCell
            cell.labelCell.text = "mdr"
            return cell
        }
        return UITableViewCell()
    }
    
}

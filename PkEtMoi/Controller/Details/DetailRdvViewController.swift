//
//  DetailRdvViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class DetailRdvViewController: UIViewController,UITableViewDataSource, UITableViewDelegate ,isAbleToReceiveAlarm {
    
    func pass(nom:String,date: Date) {
        rdv?.addAlarme(date: date)
        AppDelegate.notification.addNotification(title: "Rdv", body: (rdv?.fullname)!, date: date, identifier: "rdv" + DateHandler.toString(date: date))
        alarmeTable.reloadData()
    }
    

    var rdv : RdvModel? = nil
    
    @IBOutlet weak var alarmeTable: UITableView!
    
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var adresse: UILabel!
    @IBOutlet weak var nomprenom: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var type: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        alarmeTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nomprenom.text = rdv?.fullname!
        self.adresse.text = rdv?.adresse
        self.date.text = rdv?.getDateString()
        self.type.text = rdv!.type
        self.telephone.text = rdv?.telephone
        self.type.text = rdv?.type
        alarmeTable.delegate = self
        alarmeTable.dataSource = self
        // Do any additional setup after loading the view.
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
        return (self.rdv?.alarmes.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.alarmeTable.dequeueReusableCell(withIdentifier: "rdvDetailCell", for: indexPath) as! RdvDetailTableViewCell
        let text : DateHandler = DateHandler(date: (self.rdv?.alarmes.get(i:indexPath.row)!.date)! , formatter: "MMM dd, yyyy HH:mm")
        cell.labelCell.text = text.currentDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            var date = (self.rdv?.alarmes.get(i: indexPath.row)?.date)!
            AppDelegate.notification.removeNotification(identifier: ["rdv"+DateHandler.toString(date: date)])
            self.rdv?.deleteAlarme(date:date)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

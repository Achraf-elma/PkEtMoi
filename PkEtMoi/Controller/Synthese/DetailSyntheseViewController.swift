//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class DetailSyntheseViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var synthese : SyntheseModel? = nil
    var etatSet : EtatSet? = nil
    
    
    @IBOutlet weak var etatTable: UITableView!
    
    @IBOutlet weak var jourLabel: UILabel!
    
    var currentDay : Int16 = 1
    var currentDate : Date? = nil
    @IBAction func previousDay(_ sender: UIButton) {
        if currentDay == 1{
            return
        }
        else{
            currentDay = currentDay - 1
            currentDate = currentDate?.addingTimeInterval(-86400)
        }
        jourLabel.text = "Jour " + String(currentDay)
        self.etatSet = (synthese?.getEtats(date: currentDate!))!
        etatTable.reloadData()
    }
    @IBAction func nextDay(_ sender: UIButton) {
        if currentDay == 5{
            return
        }
        else{
            currentDay = currentDay + 1
            currentDate = currentDate?.addingTimeInterval(86400)
        }
        jourLabel.text = "Jour " + String(currentDay)
        self.etatSet = synthese?.getEtats(date: currentDate!)
        etatTable.reloadData()
    }

    @IBOutlet weak var dayRdv: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        jourLabel.text = "Jour " + String(currentDay)
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dayRdv.text = dateFormatter.string(from:(synthese?.rdv.date!)!)
        currentDate = synthese?.rdv.date
        for _ in 1...5 {
            currentDate = currentDate?.addingTimeInterval(-86400)
        }
        self.etatSet = synthese?.getEtats(date: currentDate!)
        etatTable.reloadData()
        etatTable?.delegate = self
        etatTable?.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.etatSet!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.etatTable?.dequeueReusableCell(withIdentifier: "detailSynthese", for: indexPath) as! DetailSyntheseTableViewCell
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
        var currentDate = self.etatSet?.get(i: indexPath.row)?.date
        cell.dateLabel.text = dateFormatter.string(from:currentDate!)
        cell.etatLabel.text =  self.etatSet?.get(i: indexPath.row)?.reponseEtat
        if cell.etatLabel.text == "ON"{
            cell.backgroundColor = UIColor.yellow
        }else if cell.etatLabel.text == "OFF"{
            cell.backgroundColor = UIColor.red
        }else{
            cell.backgroundColor = UIColor.green
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}





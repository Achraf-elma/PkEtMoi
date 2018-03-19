//
//  ResumeControllerViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit
import CoreData

class ResumeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var resumeTable: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var resume : [ResumeModel] = []
    var date : dateBrowserDelegate = dateBrowserDelegate()
    
    @IBAction func nextDay(_ sender: UIButton) {
        dateLabel.text = date.nextDay()
    }
    @IBAction func previousDay(_ sender: UIButton) {
        dateLabel.text = date.previousDay()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = date.currentDate
        self.saveNewResume(with: "wow")
        resumeTable.delegate = self
        resumeTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveNewResume(with resumeString: String){
        var resumeAdded:ResumeModel? = AbstractDAO.getDAO()._getResumeDAO()?._insertResume(resume: ResumeModel(label: "OMG"))
        if(resumeAdded != nil){
            self.resume.append(resumeAdded!)
            self.resumeTable.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resume.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.resumeTable.dequeueReusableCell(withIdentifier: "resumeCell", for: indexPath) as! ResumeTableViewCell
        cell.labelCell.text = self.resume[indexPath.row].label
        return cell
    }

}

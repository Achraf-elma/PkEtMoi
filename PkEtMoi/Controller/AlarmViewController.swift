//
//  AlarmViewController.swift
//  PkEtMoi
//
//  Created by Kevin Giordani on 19/03/2018.
//  Copyright © 2018 Kevin GIORDANI. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController{
    
    var delegate: isAbleToReceiveAlarm? = nil
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func validate(_ sender: Any) {
        if(self.datePicker.date.timeIntervalSince(Date()) > 0){
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.delegate?.pass(nom:"alarme",date: self.datePicker.date)
    }

}

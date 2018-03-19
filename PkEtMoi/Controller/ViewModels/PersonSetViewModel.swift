//
//  PersonSetViewModel.swift
//  TP04-MVVM-Delegate
//
//  Created by Fiorio Christophe on 14/02/2018.
//  Copyright © 2018 Christophe Fiorio. All rights reserved.
//

import Foundation
import UIKit


class PersonSetViewModel{
   
   private let modelset : PersonSet
   var dataset : [Person] = []
   let presenter : PersonPresenter = PersonPresenter()
   var delegate : PersonSetViewModelDelegate? = nil
   
   init() {
      guard let appDelegate = UIApplication.shared.delegate  else{
         fatalError()
      }
      self.modelset = (appDelegate as! AppDelegate).personCollec
      for p in self.modelset{
         self.dataset.append(p)
      }
   }
   
   public var count : Int{
      return self.dataset.count
   }
   
   public func displayPerson(at: IndexPath) -> String{
      return self.presenter.text(ofPerson: self.dataset[at.row])
   }
   
   
   public func add(person: Person){
      self.modelset.add(person: person)
      self.dataset.append(person)
      self.delegate?.personAdded(at: IndexPath(row:self.dataset.count-1,section:0))
   }
   
   public func updateBirthDate(atIndexPath indexPath: IndexPath, withDate date: Date){
      let person = self.modelset[indexPath.row]
      person.birthdate = date
      self.dataset[indexPath.row] = person
      self.delegate?.personChanged(at: indexPath)
   }
   
}

protocol PersonSetViewModelDelegate {
   func dataSetChanged()
   func personChanged(at: IndexPath)
   func personAdded(at: IndexPath)
//   func personRemoved(at: IndexPath)
}

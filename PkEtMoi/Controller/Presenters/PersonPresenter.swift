//
//  PersonPresenter.swift
//  TP03-RxSwift
//
//  Created by Fiorio Christophe on 14/02/2018.
//  Copyright © 2018 Christophe Fiorio. All rights reserved.
//

import Foundation

class PersonPresenter : PersonPresenterProtocol{
   
   func text(ofPerson person:  Person) -> String{
      let date = self.birthDate(ofPerson: person)
      if date.isEmpty{
         return person.fullname
      }
      else{
         return person.fullname + " - " + date
      }
   }
   func birthDate(ofPerson person: Person) -> String{
      guard let date = person.birthdate else{
         return ""
      }
      let df = DateFormatter()
      df.dateFormat = "dd/mm/yy"
      let ret = df.string(from: date)
      return ret
   }

}

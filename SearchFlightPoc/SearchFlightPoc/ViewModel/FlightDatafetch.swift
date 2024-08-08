//
//  FlightDatafetch.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 07/08/24.
//

import Foundation

class readJsonData : ObservableObject {
   @Published var users = [FlightModel]() // calling our Flightmodel
   
   init(){
       loadData()
   }
   func loadData(){
       guard let path = Bundle.main.path(forResource: "Flights", ofType: "json") else {
                   print("JSON file not found")
                   return
               }
       let url = URL(fileURLWithPath: path)
       do {
               let jsonData = try Data(contentsOf: url)
               let decodedItems = try JSONDecoder().decode([FlightModel].self, from: jsonData) // convert json to readable formate
                   
               self.users = decodedItems
          // print(users)
                   
           } catch {
                   print("Error decoding JSON: \(error)")
           }
   }

}

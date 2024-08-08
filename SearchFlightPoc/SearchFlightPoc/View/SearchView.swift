//
//  SearchView.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 07/08/24.
//

import SwiftUI



struct SearchView: View {
    @State private var showPopUP = false
    @State private var username: String = ""
    @State private var departureCity: String = ""
    @State private var arrivalCity: String = ""
    @State private var selectedDate : String = ""
    @ObservedObject
    var
    fetchData = readJsonData()

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    
                } label: {
                    Text("Clear All")
                        .foregroundStyle(Color(red: 106/255, green: 90/255, blue: 205/255))
                        .underline()
                }
                
            }
            .padding()
        }
 
        
        // Departure date text
        Text("Departure Date*")
            .padding(.leading)
            .frame( maxWidth: .infinity,alignment: .leading)
        
        //Date popup
        
        HStack{
            
            Image(systemName: "calendar")
                .frame(width: 20,height: 20)
                .foregroundColor(.black)
        // formatting the date and displaying as per requirment
            if selectedDate.isEmpty{
                Text(Date(), formatter: dateFormatter)
            }else{
                Text(selectedDate)
            }
          
            Spacer()
            HStack{
                Button(action: {
                    showPopUP.toggle()
                }
                       , label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                })
                .sheet(isPresented: $showPopUP, content: {
                    DatePickeView(onDismiss: $showPopUP, date: self.$selectedDate)
                })
            }
        }
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 5)
            .stroke(Color.black, lineWidth: 1))
        .padding()
        
        //Enter flight number text
        Text("Enter flight number and/or a city*")
            .padding(.leading, 10)
            .frame( maxWidth: .infinity,alignment: .leading)
            .fontWeight(.bold)
            .foregroundColor(Color(red: 0/255, green: 0/255, blue: 120/255))
            .padding(.all)
        
        //Flight number text
        Text("Flight number")
            .padding(.leading)
            .frame( maxWidth: .infinity,alignment: .leading)
       
        //Flight number textField
        TextField("Flight Number", text: $username)
        
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 2))
            .cornerRadius(5)
            .padding(.all)
       
        //City Text
        Text("City")
            .padding(.leading)
            .frame( maxWidth: .infinity,alignment: .leading)
      
            .padding(.horizontal)
        // Arrival and departure details
        HStack{
            VStack{
                HStack {
                    TextField("Departure city", text: $departureCity)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                    Image( "location")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                }
                .padding()
                CustomDivider()
    
                HStack {
                    TextField("Arrival city", text: $arrivalCity)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                    Image( "location")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding()
               
            }
        
            .overlay(Rectangle()
                .stroke(Color.black, lineWidth: 1))
            VStack {
                Button {
                //Change departure to arrival and viceversa
                                  } label: {
                                      Image(systemName: "arrow.up.arrow.down")
                                          .foregroundColor(.black)
                              }
            }
            .padding(.horizontal)
            
        }
        //CustomDivider()
        .overlay(RoundedRectangle(cornerRadius: 5)
            .stroke(Color.black, lineWidth: 1))
        .padding()
        
        //Search Button
        
            Button(action: {
                // Search action
                if username.isEmpty{
                    print("plz enter the flight number")
                }else{
                    print(username)
                }
                print(fetchData.users.count)
            }) {
                Text("Search")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 106/255, green: 90/255, blue: 205/255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        
    }
}
// function for date
private let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      return formatter
  }()

#Preview {
    SearchView()
}

//
//  DatePickeView.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 07/08/24.
//

import SwiftUI



struct DatePickeView: View {
    @Binding  var onDismiss : Bool
    //
    @State private var selectedDate = Date()
    @Binding  var date : String
  //  @ObservedObject var shareddata : SharedData

    var body: some View {
        
     
            VStack{
                       HStack{
                           
                           Text("Select a Departure Date")
                               .fontWeight(.bold)
                           Spacer()
                           Button(action: {
                               onDismiss.toggle()
                           }) {
                               Image(systemName: "xmark")
                                   .foregroundColor(.black)
                           }
                       }
                      .padding()
                
                CustomDivider()
              

                   HStack{
                        Text("Depart")
                    .frame(alignment: .leading)
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.bottom, 5)
                   
                
                    HStack{
//                        Text("Selected Date")
                        Text(selectedDate, formatter: dateFormatter)
                                            .frame(alignment: .leading)
                        Spacer()
                    }
                    .padding(.leading)

                CustomDivider()
           //Date picker
                
                       DatePicker("Depart", selection: $selectedDate, displayedComponents: .date)
                           .datePickerStyle(GraphicalDatePickerStyle())
                
                       Spacer()
                       Button("Select date") {
                        date = dateToString(selectedDate)
                           onDismiss.toggle()
                           //print(date)
                           
                           }
                       .padding(.vertical)
                       .frame(maxWidth: .infinity)
                       .background(Color(red: 106/255, green: 90/255, blue: 205/255))
                       .foregroundColor(.white)
                       }
                
                       
                       
                       
                   }
              
    }
    
    func dateToString(_ date: Date) -> String {
            let formatter = DateFormatter()
                 formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return formatter.string(from: date)
        }
    
    private let dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateStyle = .medium
          return formatter
      }()
    




#Preview {
    DatePickeView(onDismiss: .constant(false), date: .constant(""))
}

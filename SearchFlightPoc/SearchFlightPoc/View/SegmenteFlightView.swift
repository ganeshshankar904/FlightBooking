//
//  SegmenteFlightView.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 07/08/24.
//

import SwiftUI

struct SegmenteFlightView: View {
    @State private var selectedTab = 0
    @Binding var onDismiss: Bool
    // we need flight model object
    var body: some View {

        VStack{
            HStack{
                Text("Select a flight")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.blue)
                Spacer()
                Button(action: {
                    onDismiss.toggle()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }

            }
            .padding()
        }
        List {
            
            HStack {
                Picker("", selection: $selectedTab) {
                    Text("Scheduled").tag(0)
                    Text("Search").tag(1)
                   
                }
                .pickerStyle(.palette)
         
            }
       
            

                    switch(selectedTab) {
                        case 0: ScheduleView()
                    case 1: SearchView()
                    default:
                       SearchView()
                    }
                }
    }
}


#Preview {
    SegmenteFlightView(onDismiss: .constant(false))
}

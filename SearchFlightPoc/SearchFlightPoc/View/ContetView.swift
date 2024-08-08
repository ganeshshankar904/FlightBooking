//
//  ContetView.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 07/08/24.
//

import SwiftUI

struct ContetView: View {
    @State private var showPopUP = false

    var body: some View {
        VStack{
            Button("Show popup") {
                showPopUP.toggle()
             
            }
            .sheet(isPresented: $showPopUP, content: {
                SegmenteFlightView(onDismiss: $showPopUP)
            })
        }
    }
}

#Preview {
    ContetView()
}

//
//  CustomDivider.swift
//  SearchFlightPoc
//
//  Created by rongala.manikanta on 07/08/24.
//

import SwiftUI

struct CustomDivider: View {
    let color: Color = .black
    let width: CGFloat = 1

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .edgesIgnoringSafeArea(.horizontal)
    }
}


#Preview {
    CustomDivider()
}


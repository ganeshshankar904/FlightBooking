//
//  DateFormate.swift
//  SearchFlightPoc
//
//  Created by ganesh.shankar02 on 08/08/24.
//

import Foundation
let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      return formatter
  }()

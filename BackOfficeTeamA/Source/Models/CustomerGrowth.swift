//
//  CustomerGrowth.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2022/12/27.
//

import Foundation
import SwiftUI

struct CustomerGrowth: Identifiable {
    var id = UUID().uuidString
    var type: String
    var count: Int
    
    let color: Color
}

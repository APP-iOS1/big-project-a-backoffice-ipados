//
//  StoreList.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreList: View {
    let item = ["nil","Store Name","Products","Adress","Enroll Approval","Date"]
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(item,id: \.self) { item in
                Text(item)
            }
            ForEach(0..<10,id: \.self) { index in
                Text("a")
                Text("a")
                Text("a")
                Text("a")
                Text("a")
                Text("a")
            }
        }.modifier(StoreComponentModifier())
        
    }
}

struct StoreList_Previews: PreviewProvider {
    static var previews: some View {
        StoreList()
    }
}

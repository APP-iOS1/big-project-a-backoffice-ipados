//
//  MoreRequestList.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct MoreRequestList: View {
    var body: some View {
        List{
            ForEach(0..<10,id:\.self){ _ in
                Text("Current Enroll Requset")
            }
        }
        .navigationTitle("MoreRequestList")
    }
}

struct MoreRequestList_Previews: PreviewProvider {
    static var previews: some View {
        MoreRequestList()
    }
}

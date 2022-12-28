//
//  StoreCell.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct StoreCell: View {
    var body: some View {
        VStack {
            HStack {
                HStack(alignment: .center){
                    Spacer()
                    Circle()
                        .stroke(Color.black)
                        .frame(width: 50, height: 50)
                        .padding(.trailing,20)
                    Text("얼렁뚱땅 상점")
                    Spacer()
                    Divider()
                }
                HStack(alignment: .center){
                    Spacer()
                    Text("경기도 화성시 동탄반석로264 얼렁뚱땅 오피스 37-4")
                    Spacer()
                    Divider()
                }
                HStack(alignment: .center){
                    Spacer()
                    Text("2022년 12월 22일 11:40")
                    Spacer()
                    Divider()
                }
                HStack(alignment: .center){
                    Spacer()
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                    Spacer()
                    Divider()
                }
            
        }
        .frame(height: 60)
    }
    
}
}

struct StoreCell_Previews: PreviewProvider {
    static var previews: some View {
        StoreCell()
    }
}

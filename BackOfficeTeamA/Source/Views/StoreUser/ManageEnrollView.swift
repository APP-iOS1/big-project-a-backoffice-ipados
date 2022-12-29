//
//  ManageEnrollView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct ManageEnrollView: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("요청 기록")
                .font(.largeTitle)
                .padding()
            List {
                
                ForEach(0..<10,id:\.self) { _ in
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        HStack{
                            Text("정우 상점  [승인] - 22/11/11")
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        }
                    }
                }
                ForEach(0..<10,id:\.self) { _ in
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        HStack{
                            Text("시현 상점 [거부] - 22/11/11")
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            Spacer()
        }.modifier(StoreComponentModifier())
    }
}

struct ManageEnrollView_Previews: PreviewProvider {
    static var previews: some View {
        ManageEnrollView()
    }
}

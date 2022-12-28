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
            Text("Enroll Request History")
                .font(.largeTitle)
                .padding()
            List {
                
                ForEach(0..<10,id:\.self) { _ in
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        HStack{
                            Text("A Store Pass - 22/11/11")
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
                            Text("C Store Reject - 22/11/11")
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

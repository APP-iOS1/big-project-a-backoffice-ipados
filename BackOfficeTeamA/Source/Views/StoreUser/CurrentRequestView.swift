//
//  CurrentEnrollRequest.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct CurrentRequestView: View {
    @Binding var isShowingSheet : Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Current Enroll Request ")
                .font(.largeTitle)
                .padding()
            List {
                
                ForEach(0..<20,id:\.self) { _ in
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Text("B Store request - before 5 min ")
                    }
                }
            }
            Spacer()
        }.modifier(StoreComponentModifier())
    }
}

struct CurrentRequestView_Previews: PreviewProvider {
    
    @State static var isShowingSheet : Bool = false
    
    static var previews: some View {
        CurrentRequestView(isShowingSheet: $isShowingSheet)
    }
}

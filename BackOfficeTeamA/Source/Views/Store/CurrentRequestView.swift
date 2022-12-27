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
            Section {
                ForEach(0..<4,id:\.self) { _ in
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Text("B Store request - before 5 min ")
                    }
                    Divider()
                }
                
                NavigationLink {
                    MoreRequestList()
                } label: {
                    Text("more.. ").foregroundColor(.gray)
                }
            } header: {
                Text("Current Enroll Request ")
                    .font(.largeTitle)
                    .padding()
            }
            Spacer()
        }.modifier(TopItemModifier())
    }
}

struct CurrentRequestView_Previews: PreviewProvider {
    
    @State static var isShowingSheet : Bool = false
    
    static var previews: some View {
        CurrentRequestView(isShowingSheet: $isShowingSheet).frame(height: 300)
    }
}

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
            Section {
                ForEach(0..<4,id:\.self) { _ in
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Image(systemName: "checkmark.seal.fill")
                        Text("A Store Pass - 22/11/11")
                    }
                    Divider()
                }
                
                NavigationLink {
                    MoreRequestList()
                } label: {
                    Text("more.. ").foregroundColor(.gray)
                }
            } header: {
                Text("Manage Enroll Request ")
                    .font(.largeTitle)
                    .padding()
            }
            Spacer()
        }.modifier(TopItemModifier())
    }
}

struct ManageEnrollView_Previews: PreviewProvider {
    static var previews: some View {
        ManageEnrollView()
    }
}

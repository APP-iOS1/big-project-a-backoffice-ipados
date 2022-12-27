//
//  CustomerView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct CustomerView: View {
    var body: some View {
        VStack {
            HStack {
                Text("All customers")
                Button {
                    print("")
                } label: {
//                    Image(systemName: "magnifyingglass")
                    Text("Quick Search")
                }
                .modifier(MainButtonModifier())
                
                Button {
                    print("")
                } label: {
//                    Image(systemName: "magnifyingglass")
                    Text("Quick Search")
                }
                .modifier(SubButtonModifier())
                
                Button {
                    print("")
                } label: {
//                    Image(systemName: "magnifyingglass")
                    Text("Quick Search")
                }
                .modifier(OptionsButtonModifier())

            }
        }
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}

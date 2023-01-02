//
//  EnrollRequestModal.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct EnrollRequestModal: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("등록 신청서")
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("승인")
            }
        }.padding()

        
    }
}

struct EnrollRequestModal_Previews: PreviewProvider {
    static var previews: some View {
        EnrollRequestModal()
    }
}

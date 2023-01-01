//
//  SignInView.swift
//  BackOfficeTeamA
//
//  Created by 박시현 on 2023/01/01.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        VStack {
            TextField("이메일", text: $email)
                .modifier(TextFieldModifier())
            
//            Text(
            
            TextField("비밀번호", text: $password)
                .modifier(TextFieldModifier())
            
            Button("Sign in") {
                
            }
            .modifier(MainButtonModifier())
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .autocapitalization(.none)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            .frame(width: 300, height: 60)
            .font(Font.title)
            .foregroundColor(Color.black)
            .background(Color(red: 227/255, green: 227/255, blue: 233/255))
            .cornerRadius(20)
    }
}

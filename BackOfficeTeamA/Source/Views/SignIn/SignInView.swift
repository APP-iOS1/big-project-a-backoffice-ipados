//
//  SignInView.swift
//  BackOfficeTeamA
//
//  Created by 박시현 on 2023/01/01.
//

import SwiftUI

struct SignInView: View {
    @State private var isSigninProgress = false
    @State private var email = ""
    @State private var password = ""
    @FocusState private var emailFieldIsFocused: Bool
    @State private var emailIsValid = true
    @State private var _isSigninAbled = false
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var signInViewModel: SignInViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // Login 전
            if signInViewModel.currentUser == nil {
                Group {
                    TextField("이메일", text: $email)
                        .modifier(TextFieldModifier())
                        .focused($emailFieldIsFocused)
                        .onChange(of: email) { _ in
                            validate()
                        }
                    
                    SecureField("비밀번호", text: $password)
                        .modifier(TextFieldModifier())
                        .onChange(of: password) { _ in
                            validate()
                        }
                    
                    if !isSigninProgress {
                        Button("Sign in") {
                            isSigninProgress = true
        //                    //TODO: Sign in action
                            Task {
                                do {
                                    let check = try await signInViewModel.requestUserLogin(withEmail: email, withPassword: password)
                                    dismiss()
                                    print(check)
                                } catch {
                                    print(error)
                                }
                            }
                        }
                        .modifier(MainButtonModifier())
                        .disabled(!_isSigninAbled)
                    } else {
                        ProgressView()
                            .modifier(MainButtonModifier())
                    }

                    if !emailIsValid {
                        Text("이메일 형식이 올바르지 않습니다")
                            .padding(.leading, 7)
                            .foregroundColor(.red)
                    } else {
                        Text(" ")
                    }
                }
            } else {
                Button("logout") {
                    signInViewModel.requestUserSignOut()
                }
            }

            
            // Login 후
            }
        .navigationTitle("로그인/로그아웃")
        .padding()
    }
    
    func validate() {
        if email.contains("@") && !email.contains(" ") {
            emailIsValid = true
            if !password.isEmpty {
                _isSigninAbled = true
            }
        } else {
            emailIsValid = false
        }
    }
}

struct SignInView_Previews: PreviewProvider {

    static var previews: some View {
        SignInView(signInViewModel: SignInViewModel())
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            .frame(width: 300, height: 60)
            .font(Font.body)
            .foregroundColor(Color.black)
            .background(Color(red: 227/255, green: 227/255, blue: 233/255))
            .cornerRadius(20)
    }
}

//
//  EnrollRequestModal.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct EnrollRequestModal: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var manager: StoreNetworkManager
    @State var storeInfo: StoreInfo

    var body: some View {
//        VStack{
//            Text("등록 신청서")
//            Spacer()
//            Button {
//                dismiss()
//            } label: {
//                Text("승인")
//            }
//        }.padding()
        VStack {
            List {
                    Group {
                        Text ("입점 신청서")
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparatorTint(.clear)
                    .listRowSeparator (.hidden)
                    .font(.largeTitle)
                
                Section {
                    HStack(alignment: .top) {
                        Text("스토어 이름")
                            .modifier(contentNameModifier())
                        Text("\(storeInfo.storeName)")
                            .modifier(contentNameModifier())
                    }
                    HStack(alignment: .top) {
                        Text("사업장소재지 주소")
                            .modifier(contentNameModifier())
                        Text("\(storeInfo.storeLocation)")
                            .modifier(contentNameModifier())
//                            .modifier(contentFieldModifier())
                    }
                } header: {
                    Text("입점 신청")
                }
                
                Section {
                    HStack {
                        Button {
                            manager.updateStoreInfo(storeInfo, isVerified: true, isSubmitted: false)
                            dismiss()
                        } label: {
                            Text("입점 허가")
                        }.buttonStyle(PlainButtonStyle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor(.green)
                        Button {
                            manager.updateStoreInfo(storeInfo, isVerified: false, isSubmitted: false)
                            dismiss()
                        } label: {
                            Text("입점 거절")
                        }.buttonStyle(PlainButtonStyle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor(.red)
                        
                    }
                }.listRowBackground(Color.clear)
            }
            
        }
//        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        
    }
}

struct contentNameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(5)
            .frame(width: 180, alignment: .leading)
    }
}

struct contentFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .border(.gray)
            .padding(5)
    }
}


struct EnrollRequestModal_Previews: PreviewProvider {
    @State static var testStore = testStores[0]
    static var previews: some View {
        EnrollRequestModal(manager: StoreNetworkManager(with: "StoreInfo"), storeInfo: StoreNetworkManager(with: "StoreInfo").storeInfos.first!)
    }
}

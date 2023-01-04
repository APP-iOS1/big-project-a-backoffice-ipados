//
//  StoreDetailView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/28.
//

import SwiftUI

struct StoreDetailView: View {
    let storeInfo: StoreInfo
    
    @EnvironmentObject var manager: StoreNetworkManager
    @State var toBanned: Bool = true
    @State var showAlert: Bool = false
    @State var btnDisabled: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                HStack {
                    Circle()
                        .stroke(Color.black)
                        .frame(width: 50, height: 50)
                        .padding(.trailing,20)
                    Text("\(storeInfo.storeName)")
                        .font(Font.largeTitle)
                        .bold()
                }
                
                Section(header: Text("가게 정보")) {
                    Text("이름 : \(storeInfo.id)")
                    Text("이메일 : \(storeInfo.storeEmail)")
                    Text("주소 : \(storeInfo.storeLocation)")
                    Text("전화번호 : \(storeInfo.phoneNumber)")
                    Text("등록일 : \(storeInfo.registerDate)")
                    HStack{
                        Text("입점여부: ")
                        if storeInfo.isVerified {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                Section(header: Text("운영상태")){
                    HStack {
                        Button(action: {
                            //입점 미승인시 버튼 비활성화
                            if storeInfo.isVerified == false {
                                btnDisabled = true
                            } else {
//                                toBanned.toggle()
                                showAlert = true
                            }
                        }){
                            if storeInfo.isBanned == false && storeInfo.isVerified == true {
                                Text("운영중")
                                    .foregroundColor(.green)
                                    .bold()
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("스토어 운영 중지"), message: Text("정말로 중지하시겠습니까?"),
                                              primaryButton: .cancel(Text("확인"), action: {
                                            toBanned = !storeInfo.isBanned
                                            print(toBanned)
                                            manager.updateStoreBannedState(storeId: storeInfo.id, isBanned: toBanned)
                                            showAlert = false
                                        }), secondaryButton: .destructive(Text("취소")))
                                    }
                                    .onAppear(perform: {
                                        print(storeInfo.id)
                                    })
                            } else if storeInfo.isVerified == false {
                                Text("입점 대기중...")
                                    .foregroundColor(.gray)
                                    .bold()
                            } else if storeInfo.isBanned == true && storeInfo.isVerified == true {
                                Text("운영중지")
                                    .foregroundColor(.red)
                                    .bold()
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("스토어 운영 승인"), message: Text("정말로 승인하시겠습니까?"),
                                              primaryButton: .cancel(Text("확인"), action: {
                                            toBanned = !storeInfo.isBanned
                                            print(toBanned)
                                            manager.updateStoreBannedState(storeId: storeInfo.id, isBanned: toBanned)
                                            showAlert = false
                                        }), secondaryButton: .destructive(Text("취소")))
                                    }
                                    .onAppear(perform: {
                                        print(storeInfo.id)
                                    })
                            }
                        }
                        .disabled(btnDisabled)
                    }
                }
                
                Section(header: Text("상품 목록")) {
                    ForEach(manager.itemInfos) { item in
                        Text(item.itemName)
                    }
                }
//                Section(header: Text("리뷰 목록")) {
//                    Text("리뷰 내역")
//                }
            }
        }
        .task{
            await manager.requestSubCollectionInfo()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                // 5초 후 실행될 부분
                print("detailView: \(manager.itemInfos)")
            }
        }
    }
}

//struct StoreDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreDetailView()
//    }
//}

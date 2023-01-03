//
//  NotificationView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct NotificationView: View {
    @State private var pickerSelection = 0
    @State private var data = Notification.sample
    
    var body: some View {
        VStack {
            Table(data) {
                TableColumn("이름", value: \.receiverName)
                TableColumn("메세지 제목", value: \.notificationTitle)
                TableColumn("앱 종류", value: \.appCategory)
                
                TableColumn("수신 여부") { item in
                    Image(systemName: item.isViewed ? "checkmark" : "xmark")
                        .foregroundColor(item.isViewed ? Color.green : Color.red)
                }
            }
        }.navigationTitle("앱 알림 관리")
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView().previewInterfaceOrientation(.landscapeRight)
    }
}

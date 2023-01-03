//
//  NotificationView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct NotificationView: View {
    // 초기 데이터는 날짜를 기준으로 정렬되어 있음
    @State private var data = Notification.sample.sorted(using: KeyPathComparator(\.appCategory))
    @State private var sortOrder = [KeyPathComparator(\Notification.appCategory)]
    
    var body: some View {
        VStack {
            Table(data, sortOrder: $sortOrder) {
                TableColumn("이름", value: \.receiverName)
                TableColumn("메세지 제목", value: \.notificationTitle)
                TableColumn("앱 종류", value: \.appCategory)
                
                TableColumn("수신 여부", value: \.isViewedInt) { item in
                    Image(systemName: item.isViewed ? "checkmark" : "xmark")
                        .foregroundColor(item.isViewed ? Color.green : Color.red)
                }
                TableColumn("날짜", value: \.notifiactionDateAt)
            }
            .onChange(of: sortOrder) { newOrder in
                data.sort(using: newOrder)
            }
        }.navigationTitle("앱 알림 관리")
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView().previewInterfaceOrientation(.landscapeRight)
    }
}

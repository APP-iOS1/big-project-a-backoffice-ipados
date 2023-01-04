//
//  ReportDetailView.swift
//  BackOfficeTeamA
//
//  Created by Park Jungwoo on 2023/01/04.
//

import SwiftUI

struct ReportDetailView: View {
    let reportModel: TempReportModel
    var body: some View {
        VStack {
            Form {
                Section("신고자") {
                    Text(reportModel.reporter)
                    Text(reportModel.createdDate)
                }
                Section("신고 당한 가게") {
                    Text(reportModel.reported)
                }
                Section("내용") {
                    Text("\(reportModel.contents)")
                }
                
                Button {
                    print("report")
                } label: {
                    Text("신고하기")
                }

            }
        }
    }
}

struct ReportDetailView_Previews: PreviewProvider {
    static var reportModel = TempReportModel(reporter: "태영할아버지", reported: "두영전기", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 33536600)
    static var previews: some View {
        ReportDetailView(reportModel: reportModel)
    }
}

//
//  CellView.swift
//  BackOfficeTeamA
//
//  Created by 박시현 on 2022/12/28.
//

import SwiftUI

struct CellView: View {
    @State var reportData: TempReportModel
    @State private var showDetail = false
    @State var isShowingReportDetailSheet = false
    
    var body: some View {
        VStack {
            Button {
                isShowingReportDetailSheet.toggle()
            } label: {
                VStack {
                    HStack {
                        Text(reportData.createdDate)
                            .foregroundColor(.black)
                        Divider()
                        Text(reportData.reporter)
                        Text("님이 판매자")
                            .foregroundColor(.black)
                        Text(reportData.reported)
                        Text("님을 신고했습니다.")
                            .foregroundColor(.black)
                    }
                    
                    if showDetail {
                        Text(reportData.contents)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingReportDetailSheet) {
            ReportDetailSheet(reportData: reportData)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    @State static private var isShowingReportDetailSheet = false
    
    static var previews: some View {
        CellView(reportData: TempReportModel(reporter: "Sihyun", reported: "ABCD", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다 이걸 어떻게 Use", createdAt: Date().timeIntervalSince1970), isShowingReportDetailSheet: isShowingReportDetailSheet)
            .previewLayout(.fixed(width: 500, height: 70))
    }
}

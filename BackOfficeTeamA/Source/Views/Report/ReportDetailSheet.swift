//
//  ReportDetailSheet.swift
//  BackOfficeTeamA
//
//  Created by 박시현 on 2022/12/28.
//

import SwiftUI

struct ReportDetailSheet: View {
    @State var reportData: tempReportModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Reporter : ")
                Text(reportData.reporter)
                    .foregroundColor(.accentColor)
                Text("Reported : ")
                Text(reportData.reported)
                    .foregroundColor(.accentColor)
            }
            ReportDetailGridView()
            ZStack {
                Color.gray
                Text(reportData.contents)
            }
        }
        .padding()
    }
}

struct ReportDetailGridView: View {
//    let pictures = [UIImage]()
    let pictures: [any View] = Array(repeating: Rectangle().frame(width: 100, height: 100), count: 3)// 임시방편
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<5) { _ in
                    Rectangle()
                        .foregroundColor(.accentColor)
                        .frame(width: 300, height: 300)
                }
            }
        }
    }
}

struct ReportDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        ReportDetailSheet(reportData: tempReportModel(reporter: "Sihyun", reported: "ABCD", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다 이걸 어떻게 Use", createdAt: Date().timeIntervalSince1970))
    }
}

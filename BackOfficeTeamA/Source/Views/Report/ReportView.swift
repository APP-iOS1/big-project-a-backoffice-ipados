//
//  ReportView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct ReportView: View {
    @State private var searchText: String = ""
    var testReportData = ["작성자":"박시현", "내용":"ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", "신고대상":"ABC", "작성시간":"2022-12-27 14:48"]
    var testReportData2 = ["작성자":"이름이 아주 긴 작성자", "내용":"ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", "신고대상":"ABC", "작성시간":"2022-12-27 14:48"]
    
    var body: some View {
//        NavigationStack {
            List {
                ForEach(0..<2) { _ in
                    Text("test")
                }
                    CellView(reportData: testReportData)
                    CellView(reportData: testReportData2)
                
                ForEach(0..<30) { _ in
                    Text("test")
                }
                
                Text("Search Me")
                
            }
            .listStyle(.insetGrouped)
            .searchable(text: $searchText, prompt: "Search")
//        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReportView().previewInterfaceOrientation(.landscapeRight)
        }
    }
}

struct CellView: View {
    @State var reportData: [String:String]
    @State private var showDetail = false
    
    var body: some View {
        
        Button {
            showDetail.toggle()
        } label: {
            VStack {
                HStack {
                    Text(reportData["작성시간"]!)
                        .foregroundColor(.black)
                    Divider()
                    Text(reportData["작성자"]!)
                        .frame(width: 60)
                    Text("님이 판매자")
                        .foregroundColor(.black)
                    Text(reportData["신고대상"]!)
                    Text("님을 신고했습니다.")
                        .foregroundColor(.black)
                    
                    
                }
                .lineLimit(1)
                
                if showDetail {
                    Text(reportData["내용"]!)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

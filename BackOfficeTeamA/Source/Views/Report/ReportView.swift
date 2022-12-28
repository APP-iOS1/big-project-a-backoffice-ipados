//
//  ReportView.swift
//  BackOfficeTeamA
//
//  Created by MacBook on 2022/12/27.
//

import SwiftUI

struct ReportView: View {
    var pickerOptions = ["신고자", "신고대상자", "작성내용"]
    @State private var pickerSelection = 0
    @State var searchFor = ""
    @State private var reportData: [tempReportModel] = [
        tempReportModel(reporter: "Sihyun", reported: "ABCD", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다 이걸 어떻게 Use", createdAt: Date().timeIntervalSince1970),
        tempReportModel(reporter: "이름이 긴 사람", reported: "EFGH", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970),
        tempReportModel(reporter: "이름이 긴 사람2", reported: "EFGH", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 88400),
        tempReportModel(reporter: "이름이 긴 사람3", reported: "EFGH", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 804800),
        tempReportModel(reporter: "이름이 긴 사람4", reported: "EFGH", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 2892000),
        tempReportModel(reporter: "이름이 긴 사람5", reported: "EFGH", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 33536600),
    ]
    @State var searchDate = dayWeekMonthYear.all
    let buttonOption: [dayWeekMonthYear] = [.all, .day, .week, .month, .year]
    let buttonLabel = ["전체", "하루 전", "일주일 전", "한달 전", "일년 전"]
    var results: [tempReportModel] {
        //filter를 날짜로 한번하고 그 이후 필터 진행
        var dateFilteredData = reportData
        
        switch searchDate {
        case .day:
            dateFilteredData = dateFilteredData.filter {
                $0.createdAt >= Date().timeIntervalSince1970 - 86400
            }
        case .week:
            dateFilteredData = dateFilteredData.filter {
                $0.createdAt >= Date().timeIntervalSince1970 - 604800
            }
        case .month:
            dateFilteredData = dateFilteredData.filter {
                $0.createdAt >= Date().timeIntervalSince1970 - 2592000
            }
        case .year:
            dateFilteredData = dateFilteredData.filter {
                $0.createdAt >= Date().timeIntervalSince1970 - 31536000
            }
        default:
            //.all인 경우 필터 x
            break
        }
        
        if !searchFor.isEmpty && pickerSelection == 0   {
            return dateFilteredData.filter {
                $0.reporter.contains(searchFor)
            }
        } else if !searchFor.isEmpty && pickerSelection == 1 {
            return dateFilteredData.filter {
                $0.reported.contains(searchFor)
            }
        } else if !searchFor.isEmpty && pickerSelection == 2 {
            return dateFilteredData.filter {
                $0.contents.contains(searchFor)
            }
        }
        return dateFilteredData
    }
    
    var body: some View {

            List {
                HStack {
                    ForEach(0..<buttonOption.count, id: \.self) { idx in
                        Button {
                            searchDate = buttonOption[idx]
                        } label: {
                            Text(buttonLabel[idx])
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .modifier(OptionsButtonModifier())
                }
                
                
                if !results.isEmpty {
                    ForEach(results, id: \.self) { group in
                        CellView(reportData: group)
                    }
                } else {
                    // 조건에 맞는 신고 데이터가 없는 경우 표시할 뷰
                    VStack {
                        Text("조건에 맞는 데이터가 없습니다")
                    }
                    
                }
            }
            .listStyle(.insetGrouped)
            .searchable(text: $searchFor, prompt: "Search")
//        .searchable(text: $searchFor, placement: .navigationBarDrawer(displayMode: .always))
        .toolbar {
                Picker("Select", selection: $pickerSelection) {
                    ForEach(0..<pickerOptions.count, id: \.self) {
                        Text(pickerOptions[$0])
                    }
                }
            }
        }
}

enum dayWeekMonthYear {
    case all
    case day
    case week
    case month
    case year
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReportView().previewInterfaceOrientation(.landscapeRight)
        }
    }
}

struct CellView: View {
    @State var reportData: tempReportModel
    @State private var showDetail = false
    
    var body: some View {
        
        Button {
            showDetail.toggle()
        } label: {
            VStack {
                HStack {
                    Text(reportData.createdDate)
                        .foregroundColor(.black)
                    Divider()
                    Text(reportData.reporter)
//                        .frame(width: 60)
                    Text("님이 판매자")
                        .foregroundColor(.black)
                    Text(reportData.reported)
                    Text("님을 신고했습니다.")
                        .foregroundColor(.black)
                    
                    
                }
//                .lineLimit(1)
                
                if showDetail {
                    Text(reportData.contents)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

// 테스트를 위한 신고 임시 모델
struct tempReportModel: Hashable {
    var reporter: String
    var reported: String
    var contents: String
    var createdAt: Double
    
    var createdDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd" // "yyyy-MM-dd HH:mm:ss"
        
        let dateCreatedAt = Date(timeIntervalSince1970: createdAt)
        
        return dateFormatter.string(from: dateCreatedAt)
    }
}



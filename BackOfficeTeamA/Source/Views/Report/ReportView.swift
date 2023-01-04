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
    @State private var reportData: [TempReportModel] = [
        TempReportModel(reporter: "태영아빠", reported: "두영상점", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다 이걸 어떻게 Use", createdAt: Date().timeIntervalSince1970),
        TempReportModel(reporter: "태영맘", reported: "다영이네 CPU", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970),
        TempReportModel(reporter: "태영삼촌", reported: "정우네 GPU", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 88400),
        TempReportModel(reporter: "태영이모", reported: "광현 RAM샵", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 804800),
        TempReportModel(reporter: "태영고모", reported: "찬호전자", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 2892000),
        TempReportModel(reporter: "태영할아버지", reported: "두영전기", contents: "ABC 판매자를 신고합니다 왜냐하면 상품이 OOO이기 때문입니다", createdAt: Date().timeIntervalSince1970 - 33536600),
    ]
    
    @State var searchDate = dayWeekMonthYear.all
    let buttonOption: [dayWeekMonthYear] = [.all, .day, .week, .month, .year]
    let buttonLabel = ["전체", "하루 전", "일주일 전", "한달 전", "일년 전"]
    var results: [TempReportModel] {
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
    
    @State private var sortOrder = [KeyPathComparator(\TempReportModel.reporter)]
    @State private var selection: TempReportModel.ID?
    @State var path = [TempReportModel]()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                        Text("❗️조건에 맞는 데이터가 없습니다")
                    }
                }
            }
            VStack(alignment: .leading) {
                Text("신고 내역")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                Table(reportData, selection: $selection) {
                    TableColumn("신고당한 가게", value: \.reported)
                    TableColumn("신고한 사람", value: \.reporter)
                    //                TableColumn("제목", value: \.id)
                    TableColumn("날짜", value: \.createdDate)
                }
                .onChange(of: selection) { selection in
                    if let selection = selection,
                       let data = reportData.first(where: {$0.id == selection}) {
                        path.append(data)
                    }
                }
                //            .onChange(of: sortOrder, perform: { newOrder in
                //                reportData.sorted(using: newOrder)
                //            })
                .listStyle(.insetGrouped)
                .searchable(text: $searchFor, prompt: "검색")
                .toolbar {
                    Picker("Select", selection: $pickerSelection) {
                        ForEach(0..<pickerOptions.count, id: \.self) {
                            Text(pickerOptions[$0])
                        }
                    }
                }
            }
            .navigationDestination(for: TempReportModel.self) { data in
                ReportDetailView()
            }
        }
        .navigationTitle(Text("신고"))
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
        ReportView().previewInterfaceOrientation(.landscapeRight)
    }
}

// 테스트를 위한 신고 임시 모델
struct TempReportModel: Hashable, Identifiable {
    var id = UUID().uuidString
    
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



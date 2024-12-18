//
//  ContentView.swift
//  RadioButton
//
//  Created by ronnie on 2024/12/18.
//

import SwiftUI

enum QueryOption: CaseIterable, Hashable {
    case queryName, queryNumber, queryPhone
    
    var labelString: String {
        switch self {
        case .queryName: return "氏名"
        case .queryNumber: return "予約番号"
        case .queryPhone: return "電話番号"
        }
    }
    
}

struct ContentView: View {
    @State var selectedOption: QueryOption = .queryName
    @State var selectedOption2: QueryOption = .queryNumber
    
    var body: some View {
        VStack {
            Text("例1️⃣: Default")
            VStack(alignment: .leading) {
                ForEach(QueryOption.allCases, id: \.self) { option in
                    RadioButton(tag: option, selection: $selectedOption, labelString: option.labelString) {
                        print("\(option.labelString) is selected")
                    }
                }
            }
            .padding(.bottom, 30)
            
            HStack {
                ForEach(QueryOption.allCases, id: \.self) { option in
                    RadioButton(
                        tag: option,
                        selection: $selectedOption,
                        labelString: option.labelString
                    )
                }
            }
            .padding(.bottom, 30)
            
            Text("例2️⃣：custom")
            Text("选择: \(selectedOption2.labelString)")
            HStack {
                RadioButton(
                    tag: QueryOption.queryName,
                    selection: $selectedOption2,
                    labelString: QueryOption.queryName.labelString
                ){
                    print("可选：选中后action")

                }
                RadioButton(
                    tag: QueryOption.queryNumber,
                    selection: $selectedOption2,
                    labelString: QueryOption.queryNumber.labelString,
                    selectionColor: .blue
                )
                RadioButton(
                    tag: QueryOption.queryPhone,
                    selection: $selectedOption2,
                    labelString: QueryOption.queryPhone.labelString,
                    selectionColor: .black,
                    deselectionColor: .black,
                    font: .title,
                    circleSize: 40.0
                )
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

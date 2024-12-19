Example:

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

ForEach(QueryOption.allCases, id: \.self) { option in
                    RadioButton(tag: option, selection: $selectedOption, labelString: option.labelString) {
                        print("\(option.labelString) is selected")
                    }

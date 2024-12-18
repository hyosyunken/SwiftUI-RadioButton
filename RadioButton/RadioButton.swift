//
//  RadioButton.swift
//  RadioButton
//
//  Created by ronnie on 2024/12/19.
//

import SwiftUI

struct RadioButton<V: Hashable>: View {
    private let tag: V
    @Binding private var selection: V
    private let labelString: String
    private let action: (() -> Void)?
    
    private let selectionColor: Color
    private let deselectionColor: Color
    private let font: Font
    private let circleSize: CGFloat
    
    init(
        tag: V,
        selection: Binding<V>,
        labelString: String =  "",
        action: (() -> Void)? = nil,
        selectionColor: Color = .red,
        deselectionColor: Color = .gray,
        font: Font = .body,
        circleSize: CGFloat = 24
    ) {
        self.tag = tag
        self._selection = selection
        self.labelString = labelString
        self.action = action
        
        self.selectionColor = selectionColor
        self.deselectionColor = deselectionColor
        self.font = font
        self.circleSize = circleSize
    }
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            circleView
            labelView
        }
        .contentShape(Rectangle())
        .onTapGesture {
            selection = tag
            action?()
        }
    }
}

private extension RadioButton {
    @ViewBuilder
    var labelView: some View {
        Text(labelString)
            .font(font)
            .foregroundStyle(.primary)
    }
    
    @ViewBuilder
    var circleView: some View {
        Circle()
            .fill(innerCircleColor)
            .padding(4)
            .overlay {
                Circle()
                    .stroke(outlineColor, lineWidth: 2)
            }
            .frame(width: circleSize, height: circleSize)
    }
    
    var innerCircleColor: Color {
        return selection == tag ? selectionColor : .clear
    }
    
    var outlineColor: Color {
        return selection == tag ? selectionColor : deselectionColor
    }
}

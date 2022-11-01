//
//  ExpandingTextView.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 01.11.22.
//

import SwiftUI

struct ExpandingTextView: View {
    @Binding var text: String
    let minHeight: CGFloat = 150
    @State private var height: CGFloat?

    var body: some View {
        WrappedTextView(text: $text, textDidChange: self.textDidChange)
            .frame(height: height ?? minHeight)
    }

    private func textDidChange(_ textView: UITextView) {
        self.height = max(textView.contentSize.height, minHeight)
    }
}

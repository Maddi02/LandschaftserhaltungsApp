//
//  CollabsableWheelPicker.swift
//  Landschaftserhaltungs
//
//  Created by Baier on 06.12.22.
//

import Foundation
import SwiftUI

struct CollapsableWheelPicker<Label, Item, Content>: View
where Content: View, Item: Hashable, Label: View
{
    @Binding var showsPicker: Bool
    var picker: Picker<Label, Item, Content>
    
    init<S: StringProtocol>(_ title: S,
                            showsPicker: Binding<Bool>,
                            selection: Binding<Item>,
                            @ViewBuilder content: ()->Content)
    where Label == Text
    {
        self._showsPicker = showsPicker
        self.picker = Picker(title, selection: selection, content: content)
    }
    var body: some View {
        Group {
            if showsPicker {
                picker
                .pickerStyle(WheelPickerStyle())
            }
        }
    }
}

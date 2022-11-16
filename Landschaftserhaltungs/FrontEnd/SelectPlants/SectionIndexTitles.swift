//
//  SectionIndexTitles.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 16.11.22.
//

import SwiftUI

struct SectionIndexTitles: View {
    let proxy: ScrollViewProxy
    let titles: [String]
    @GestureState private var dragLocation: CGPoint = .zero
    
    var body: some View {
        VStack {
            ForEach(titles, id: \.self) { title in
                Text( title).foregroundColor(.blue)
                    .background(dragObserver(title: title))
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .updating($dragLocation) { value, state, _ in
                    state = value.location
                }
        )
    }
    
    func dragObserver(title: String) -> some View {
        GeometryReader { geometry in
            dragObserver(geometry: geometry, title: title)
        }
    }
    
    func dragObserver(geometry: GeometryProxy, title: String) -> some View {
        if geometry.frame(in: .global).contains(dragLocation) {
            DispatchQueue.main.async {
                proxy.scrollTo(title, anchor: .center)
            }
        }
        return Rectangle().fill(Color.clear)
    }
}

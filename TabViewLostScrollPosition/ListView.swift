//
//  ListView.swift
//  TabViewLostScrollPosition
//
//  Created by Joan Duat on 5/10/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        let _ = print("Recompute \(viewModel.name) view.")
        List {
            ForEach(0..<viewModel.totalItems, id: \.self) { index in
                Text("\(viewModel.name) Item #\(index)")
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView(viewModel: ListViewModel(index: 0))
}

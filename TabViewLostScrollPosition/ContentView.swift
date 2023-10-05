//
//  ContentView.swift
//  TabViewLostScrollPosition
//
//  Created by Joan Duat on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        let _ = print("Recompute ContentView")
        VStack(spacing: 0) {
            contentSwitcher
                .padding(.bottom, 20)
            sectionContent
            Spacer(minLength: 0)
        }
        .padding()
    }

    @ViewBuilder
    private var contentSwitcher: some View {
        Picker("", selection: $viewModel.selectedIndex) {
            ForEach(0..<viewModel.totalTabs, id: \.self) { index in
                Text("Tab \(index)").tag(index)
            }
        }.pickerStyle(.segmented)
    }

    @ViewBuilder
    var sectionContent: some View {
        TabView(selection: $viewModel.selectedIndex,
                content: {
            ForEach(0..<viewModel.totalTabs, id: \.self) { index in
                ListView(viewModel: viewModel.listViewModels[index])
                    .tag(index)
            }})
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}

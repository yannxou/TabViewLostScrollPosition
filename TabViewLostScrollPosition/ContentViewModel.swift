//
//  ContentViewModel.swift
//  TabViewLostScrollPosition
//
//  Created by Joan Duat on 5/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    let totalTabs = 5

    @Published var selectedIndex: Int = 0
    @Published var listViewModels: [ListViewModel]

    init() {
        listViewModels = []
        for i in 0..<totalTabs {
            listViewModels.append(ListViewModel(index: i))
        }
    }

}

//
//  ListViewModel.swift
//  TabViewLostScrollPosition
//
//  Created by Joan Duat on 5/10/23.
//

import Foundation

class ListViewModel: ObservableObject {
    let totalItems = 50
    let index: Int

    var name: String { "List #\(index)" }

    init(index: Int) {
        self.index = index
    }
}

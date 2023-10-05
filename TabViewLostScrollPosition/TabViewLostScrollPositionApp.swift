//
//  TabViewLostScrollPositionApp.swift
//  TabViewLostScrollPosition
//
//  Created by Joan Duat on 5/10/23.
//

import SwiftUI

@main
struct TabViewLostScrollPositionApp: App {
    @StateObject var viewModel = ContentViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}

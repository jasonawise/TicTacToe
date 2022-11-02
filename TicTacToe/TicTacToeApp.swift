//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(GlobalVars())
        }
    }
}

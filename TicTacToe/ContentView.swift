//
//  ContentView.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import SwiftUI

struct ContentView: View {
  @StateObject var squareVars = GlobalVars()

    var body: some View {
        VStack {
          SquareTileView()
          Button("Reset Game", action: squareVars.resetGame)
          HStack {
            Section {
              Text(squareVars.currentPlayersTurn)
            } header: {
              Text("Current Players Turn: ")
            }
          }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

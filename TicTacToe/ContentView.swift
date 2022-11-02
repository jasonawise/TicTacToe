//
//  ContentView.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var squareVars: GlobalVars
  var body: some View {
    VStack {
      Grid {
        ForEach(squareVars.gameBoardData.boardData.indices, id: \.self) { index in
          GridRow {
            SquareTileView(squareIndex: $squareVars.gameBoardData.boardData[index].id)
          }
//          ForEach(0..<3) { _ in
//            GridRow {
//              ForEach(0..<3) { _ in
//                SquareTileView(squareIndex: $squareVars.gameBoardData.boardData[index].id)
//              }
//            }
//          }
        }
      }
      Button("Reset Game", action: squareVars.resetGame)
      HStack {
        Section {
          Text(squareVars.data.currentPlayersTurn)
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
    ContentView().environmentObject(GlobalVars())
  }
}

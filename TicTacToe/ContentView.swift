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
      Grid() {
          GridRow {
            ForEach(squareVars.gameBoardData.boardData.indices, id: \.self) { index in
              if index < 3 {
                ForEach(0..<1) { _ in
                  SquareTileView(squareIndex: $squareVars.gameBoardData.boardData[index].id)
                }
              }
          }
        }
        GridRow {
          ForEach(squareVars.gameBoardData.boardData.indices, id: \.self) { index in
            if index > 2 && index < 6 {
              ForEach(0..<1) { _ in
                SquareTileView(squareIndex: $squareVars.gameBoardData.boardData[index].id)
              }
              
            }
          }
        }
        GridRow {
          ForEach(squareVars.gameBoardData.boardData.indices, id: \.self) { index in
            if index > 5 {
              ForEach(0..<1) { _ in
                SquareTileView(squareIndex: $squareVars.gameBoardData.boardData[index].id)
              }
              
            }
          }
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

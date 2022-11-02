//
//  GlobalVars.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import Foundation

struct GameData : Hashable {
  var id: Int
  var currentPlayersTurn: String
  var squareStatus: String
}

struct BoardData: Hashable {
  var boardData: [GameData]
}

class GlobalVars: ObservableObject {
  @Published var squareStatus: String = "empty"
  @Published var currentPlayersTurn: String = "playerOne"
  
  @Published var data: GameData = GameData(id: 1, currentPlayersTurn: "playerOne", squareStatus: "empty")
  @Published var gameBoardData: BoardData = BoardData(boardData: [])
  
  init() {
    self.createBoard()
  }
  
  func resetGame() {
    data.squareStatus = "empty"
    data.currentPlayersTurn = "playerOne"
  }
  
  func createBoard() {
    for i in stride(from: 0, to: 9, by: 1) {
      gameBoardData.boardData.append(GameData(id: i, currentPlayersTurn: "playerOne", squareStatus: "empty"))
    }
    
    print(gameBoardData.boardData)
        
  }
}

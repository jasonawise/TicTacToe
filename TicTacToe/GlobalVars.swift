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
  var numberOfTurns: Int?
  var playerOneChoosenSquares: [Int]?
  var playerTwoChoosenSquares: [Int]?
}

struct BoardData: Hashable {
  var boardData: [GameData]
}

class GlobalVars: ObservableObject {
  @Published var data: GameData = GameData(
    id: 1,
    currentPlayersTurn: "playerOne",
    squareStatus: "empty",
    numberOfTurns: 0,
    playerOneChoosenSquares: [],
    playerTwoChoosenSquares: []
  )
  
  @Published var gameBoardData: BoardData = BoardData(boardData: [])
  
  init() {
    self.createBoard()
  }
  
  func resetGame() {
    // this needs to be fixed
    data.squareStatus = "empty"
    data.currentPlayersTurn = "playerOne"
  }
  
  func createBoard() {
    for i in stride(from: 0, to: 9, by: 1) {
      gameBoardData.boardData.append(GameData(id: i, currentPlayersTurn: "playerOne", squareStatus: "empty"))
    }
  }
  
  func checkForWinner() {
    if (data.numberOfTurns! > 3) {
      // lets check for a winner
     
    }
  }
  
  func toogleSquareStatus(squareIndex: Int) {
    // if number of turns > 3 then need to check for winner
    self.checkForWinner()
    switch gameBoardData.boardData[squareIndex].squareStatus {
    case "playerOne":
      data.currentPlayersTurn = "playerOne"
    case "playerTwo":
      data.currentPlayersTurn = "playerOne"
      data.playerTwoChoosenSquares?.append(squareIndex)
    case "empty":
      if (data.currentPlayersTurn == "playerOne") {
        gameBoardData.boardData[squareIndex].squareStatus = "playerOne"
        data.playerOneChoosenSquares?.append(squareIndex)
        data.currentPlayersTurn = "playerTwo"
      } else {
        gameBoardData.boardData[squareIndex].squareStatus = "playerTwo"
        data.playerTwoChoosenSquares?.append(squareIndex)
        data.currentPlayersTurn = "playerOne"
      }
    default:
      gameBoardData.boardData[squareIndex].squareStatus = "empty"
    }
    
    data.numberOfTurns! += 1
  }
}

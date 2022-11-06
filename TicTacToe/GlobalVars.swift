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
  var winner: String?
  var gameOver: Bool?
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
    playerTwoChoosenSquares: [],
    winner: "",
    gameOver: false
  )
  
  @Published var gameBoardData: BoardData = BoardData(boardData: [])
  
  init() {
    self.createBoard()
  }
  
  func resetGame() {
    gameBoardData.boardData.removeAll()
    data.currentPlayersTurn = "playerOne"
    self.createBoard()
  }
  
  func createBoard() {
    for i in stride(from: 0, to: 9, by: 1) {
      gameBoardData.boardData.append(GameData(id: i, currentPlayersTurn: "playerOne", squareStatus: "empty"))
    }
  }
  
  func checkForWinner() {
    let winConditions = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    
      for winCondition in winConditions {
        if winCondition.elementsEqual(data.playerOneChoosenSquares!) || winCondition.elementsEqual(data.playerTwoChoosenSquares!) {
          // set our winnder
          data.winner = data.currentPlayersTurn
          data.gameOver = true
        }
      }
    }
  
  func toogleSquareStatus(squareIndex: Int) {
    
    if gameBoardData.boardData[squareIndex].squareStatus == "empty" {
      switch data.currentPlayersTurn {
      case "playerOne":
        gameBoardData.boardData[squareIndex].squareStatus = "playerOne"
        data.playerOneChoosenSquares?.append(squareIndex)
        data.currentPlayersTurn = "playerTwo"
      case "playerTwo":
        gameBoardData.boardData[squareIndex].squareStatus = "playerTwo"
        data.playerTwoChoosenSquares?.append(squareIndex)
        data.currentPlayersTurn = "playerOne"
      default:
        gameBoardData.boardData[squareIndex].squareStatus = "empty"
      }
    }
   
    data.numberOfTurns! += 1
    
    // if number of turns > 3 then need to check for winner
    if data.numberOfTurns! > 3 {
      self.checkForWinner()
    }
  }
}

//
//  GlobalVars.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import Foundation

class GlobalVars: ObservableObject {
  @Published var squareStatus: String = "empty"
  @Published var currentPlayersTurn: String = "playerOne"
  
  func resetGame() {
    squareStatus = "empty"
    currentPlayersTurn = "playerOne"
  }
}

//
//  SquareTileView.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import SwiftUI

struct SquareTileView: View {
  @EnvironmentObject var squareVars: GlobalVars
  @Binding var squareIndex: Int
  
    var body: some View {
      Button(action: {
        toogleSquareStatus()
      }, label: {
        Text(squareVars.gameBoardData.boardData[squareIndex].squareStatus == "playerOne" ? "X" : squareVars.gameBoardData.boardData[squareIndex].squareStatus == "playerTwo" ? "O" : " ")
          .font(.largeTitle)
          .bold()
          .foregroundColor(.black)
          .frame(width: 70, height: 70)
          .background(Color.gray)
          .padding(4)
          .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
      })
    }
  
  func toogleSquareStatus() {
    // if number of turns > 3 then need to check for winner
    switch squareVars.gameBoardData.boardData[squareIndex].squareStatus {
    case "playerOne":
      squareVars.data.currentPlayersTurn = "playerOne"
    case "playerTwo":
      squareVars.data.currentPlayersTurn = "playerOne"
    case "empty":
      if (squareVars.data.currentPlayersTurn == "playerOne") {
        squareVars.gameBoardData.boardData[squareIndex].squareStatus = "playerOne"
        squareVars.data.currentPlayersTurn = "playerTwo"
      } else {
        squareVars.gameBoardData.boardData[squareIndex].squareStatus = "playerTwo"
        squareVars.data.currentPlayersTurn = "playerOne"
      }
    default:
      squareVars.gameBoardData.boardData[squareIndex].squareStatus = "empty"
    }
    
    squareVars.data.numberOfTurns! += 1
  }
}



struct SquareTileView_Previews: PreviewProvider {
    static var previews: some View {
      SquareTileView(squareIndex: .constant(4))
        .environmentObject(GlobalVars())
    }
}

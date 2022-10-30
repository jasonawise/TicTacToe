//
//  SquareTileView.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

// This view needs to do:
// 1. render a square
// 2. toogle X, O, or empty in that square

import SwiftUI

struct SquareTileView: View {
    @ObservedObject var squareVars = GlobalVars()
  
    var body: some View {
      Button(action: {
        toogleSquareStatus()
      }, label: {
        Text(squareVars.squareStatus == "playerOne" ? "X" : squareVars.squareStatus == "playerTwo" ? "O" : " ")
          .font(.largeTitle)
          .bold()
          .foregroundColor(.black)
          .frame(width: 70, height: 70)
          .background(Color.gray)
          .padding(4)
      })
    }
  
  func toogleSquareStatus() {
    switch squareVars.squareStatus {
    case "playerOne":
      squareVars.squareStatus = "playerTwo"
      return squareVars.currentPlayersTurn = "playerOne"
    case "playerTwo":
      squareVars.squareStatus = "playerOne"
      return squareVars.currentPlayersTurn = "playerTwo"
    case "empty":
      if (squareVars.currentPlayersTurn == "playerOne") {
        squareVars.squareStatus = squareVars.currentPlayersTurn
        return squareVars.currentPlayersTurn = "playerTwo"
      }
    default:
      squareVars.squareStatus = "empty"
    }
  }
}



struct SquareTileView_Previews: PreviewProvider {
    static var previews: some View {
        SquareTileView()
    }
}

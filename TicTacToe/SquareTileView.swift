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
  @EnvironmentObject var squareVars: GlobalVars
  @Binding var squareIndex: Int
  
    var body: some View {
      Button(action: {
        toogleSquareStatus()
      }, label: {
//        Text(squareVars.data.squareStatus == "playerOne" ? "X" : squareVars.data.squareStatus == "playerTwo" ? "O" : " ")
        Text("\(squareVars.gameBoardData.boardData[squareIndex].id)")
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
    switch squareVars.data.squareStatus {
    case "playerOne":
      squareVars.data.squareStatus = "playerTwo"
      squareVars.data.currentPlayersTurn = "playerOne"
    case "playerTwo":
      squareVars.data.squareStatus = "playerOne"
      squareVars.data.currentPlayersTurn = "playerTwo"
    case "empty":
      print("empty case")
      if (squareVars.data.currentPlayersTurn == "playerOne") {
        squareVars.data.squareStatus = squareVars.data.currentPlayersTurn
        squareVars.data.currentPlayersTurn = "playerTwo"
      } else {
        squareVars.data.squareStatus = "playerTwo"
      }
    default:
      squareVars.data.squareStatus = "empty"
    }
  }
}



struct SquareTileView_Previews: PreviewProvider {
    static var previews: some View {
      SquareTileView(squareIndex: .constant(4))
//        .environmentObject(GlobalVars())
    }
}

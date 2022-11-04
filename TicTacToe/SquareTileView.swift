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
        squareVars.toogleSquareStatus(squareIndex: squareIndex)
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
}



struct SquareTileView_Previews: PreviewProvider {
    static var previews: some View {
      SquareTileView(squareIndex: .constant(4))
        .environmentObject(GlobalVars())
    }
}

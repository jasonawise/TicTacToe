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
  @State private var squareStatus: String = "empty"
    var body: some View {
      Button(action: {
        myAction()
      }, label: {
        Text(squareStatus == "playerOne" ? "X" : squareStatus == "playerTwo" ? "O" : " ")
          .font(.largeTitle)
          .bold()
          .foregroundColor(.black)
          .frame(width: 70, height: 70)
          .background(Color.gray)
          .padding(4)
      })
    }
}

func myAction() {
  return print("I RAN")
}

struct SquareTileView_Previews: PreviewProvider {
    static var previews: some View {
        SquareTileView()
    }
}

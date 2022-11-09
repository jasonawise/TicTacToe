//
//  ContentView.swift
//  TicTacToe
//
//  Created by Jason Wise on 10/30/22.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var squareVars: GlobalVars
  @State private var showingSheet = false
  
  var body: some View {
    VStack {
      Button {
        showingSheet.toggle()
      } label: {
        Image(systemName: "gear")
          .imageScale(.large)
      }
      .sheet(isPresented: $showingSheet) {
        SettingsView()
      }
   
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
//      HStack {
//        if squareVars.data.gameOver! {
//          Section {
//            Text(squareVars.data.winner!)
//          } header: {
//            Text("We Have a Winner and they are: ")
//          }
//        }
//      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(GlobalVars())
  }
}

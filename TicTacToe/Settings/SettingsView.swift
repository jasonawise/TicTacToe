//
//  SettingsView.swift
//  TicTacToe
//
//  Created by Jason Wise on 11/8/22.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.colorScheme) var colorScheme
  
    var body: some View {
      NavigationView {
        VStack {
          HStack {
            Text("Settings")
              .font(.title2)
              .padding()
            Text("Done")
          }
          Text(colorScheme == .dark ? "In dark mode" : "In light mode")
          List {
            NavigationLink {
              Text("Theme Settings View")
            } label: {
              Text("Theme")
            }
            
            Text("About")
            Text("Learn More")
          }
        }
      }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

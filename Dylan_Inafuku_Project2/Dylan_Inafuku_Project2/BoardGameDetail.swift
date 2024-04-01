//
//  BoardGameDetail.swift
//  Dylan_Inafuku_Project2
//
//  Created by Dylan Inafuku on 4/1/24.
//

// imports
import Foundation
import SwiftUI

struct BoardGameDetail: View {
    let selectedGame: BoardGame
    
    // state variable to allow chaning the color of text from black to red
    @State private var changeColor = false
    
    var body: some View {
        // Displays game details
        VStack {
            Form {
                // displayed information about selected game includes name, description, popularity (popular vs. not popular)
                Section(header: Text("Game Details")) {
                    Image(selectedGame.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(selectedGame.name)
                        .font(.headline)
                        // Change text color conditionally
                        .foregroundColor(changeColor ? .red : .primary)
                    
                    Text(selectedGame.description)
                        .font(.body)
                        // Change text color conditionally
                        .foregroundColor(changeColor ? .red : .primary)
                    
                    // checkmark.cricle if the game is popular, xmark.circle if not popular
                    HStack {
                        Text("Popular")
                            .font(.headline)
                            // Change text color conditionally
                            .foregroundColor(changeColor ? .red : .primary)
                        
                        Spacer()
                        Image(systemName: selectedGame.isPopular ? "checkmark.circle" : "xmark.circle")
                            // Change text color conditionally
                            .foregroundColor(changeColor ? .red : .primary)
                    }
                }
            }
            
            // Button to toggle text color
            Button(action: {
                changeColor.toggle()
            }) {
                Text("Change Color")
            }
            .padding(.top, 20)
            .padding(.trailing)
        }
    }
}

struct BoardGameDetail_Previews: PreviewProvider {
    static var previews: some View {
        BoardGameDetail(selectedGame: gameData[1])
    }
}

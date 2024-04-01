//
//  AddNewGame.swift
//  Dylan_Inafuku_Project2
//
//  Created by Dylan Inafuku on 4/1/24.
//

// import statements
import Foundation
import SwiftUI

struct AddNewGame: View {
    // create a boardgameStore variable for this new game
    @StateObject var boardGameStore : BoardGameStore
    
    // input parameters for board game object
    @State private var isPopular = false
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            // display a dice to represent a new board game
            Section(header: Text("Board Game Details")) {
                Image(systemName: "die.face.5.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 250)
                    .padding()
                
                // take input for name and description
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                // toggle button for popular/non-popular board games
                Toggle(isOn: $isPopular){
                    Text("Popular")
                        .font(.headline)
                }.padding()
            }
            
            // button to add the game to the list
            Button(action: addNewGame){
                Text("Add Game")
            }
        }
    }
    
    // function to add the new game
    func addNewGame() {
        // create a board game object given the user input
        let newGame = BoardGame(id: UUID().uuidString,
                                name: name, description: description,
                                isPopular: isPopular, imageName: "question_mark" )
        // add to the array of board games
        boardGameStore.boardGame.append(newGame)
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    
    // create a section to allow user input for name and description
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding(EdgeInsets())
    }
}

struct AddNewGame_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGame(boardGameStore: BoardGameStore(boardGame:gameData))
    }
}

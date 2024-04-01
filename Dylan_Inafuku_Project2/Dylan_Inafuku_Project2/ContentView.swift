//
//  ContentView.swift
//  Dylan_Inafuku_Project2
//
//  Created by Dylan Inafuku on 4/1/24.
//

// import statement
import SwiftUI

struct ContentView: View {
    // initializes boardgamestore property, passing in board game data
    @StateObject private var boardGameStore : BoardGameStore = BoardGameStore(boardGame:gameData)
    
    var body: some View {
        // home screen
        NavigationView {
            // list of board games and delete/move operations
            List {
                ForEach (boardGameStore.boardGame) { boardGame in
                    ListCell(boardGame: boardGame)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Board Games"))
            // adds navigation to add game page/view when button is pressed
            .navigationBarItems(leading: NavigationLink(destination:AddNewGame(boardGameStore: self.boardGameStore)) {
                Text("Add")
                    .foregroundColor(.blue)
                // adds edit button to page to manipulate/move/delete items in list
            }, trailing: EditButton())
        }
    }
    // deletes board games upon pressing delete button
    func deleteItems(at offsets: IndexSet) {
        boardGameStore.boardGame.remove(atOffsets: offsets)
    }
    // updates item positions upon move
    func moveItems(from source: IndexSet, to destination: Int) {
        boardGameStore.boardGame.move(fromOffsets: source, toOffset: destination)
    }
}

// view for individual cells/board games in the list
struct ListCell: View {
    var boardGame: BoardGame
    var body: some View {
        // add navigation to details page when a board game is selected
        NavigationLink(destination: BoardGameDetail(selectedGame: boardGame)) {
            // HStack of board games with image on the left and name on the right
            HStack {
                Image(boardGame.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(boardGame.name)
            }
        }
    }
}

#Preview {
    ContentView()
}

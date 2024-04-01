//
//  BoardGameStore.swift
//  Dylan_Inafuku_Project2
//
//  Created by Dylan Inafuku on 4/1/24.
//

// import statements
import Foundation
import SwiftUI
import Combine

// manages an array of board game objects
class BoardGameStore : ObservableObject {
    // properties marked by published will be automatically updated in UI
    @Published var boardGame: [BoardGame]
    init (boardGame: [BoardGame] = []) {
        self.boardGame = boardGame
    }
}

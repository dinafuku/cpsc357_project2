//
//  BoardGame.swift
//  BoardGames
//
//  Created by Dylan Inafuku on 4/1/24.
//

// import statements
import Foundation
import SwiftUI

// struct for board games which include an id, name, description, popularity bool, and imageName for identification
struct BoardGame : Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var isPopular: Bool
    var imageName: String
}

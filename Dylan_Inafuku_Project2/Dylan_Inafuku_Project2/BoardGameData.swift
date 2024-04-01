//
//  BoardGameData.swift
//  Dylan_Inafuku_Project2
//
//  Created by Dylan Inafuku on 4/1/24.
//

// import statement
import Foundation
import UIKit
import SwiftUI

// variable to load data into an array
var gameData: [BoardGame] = loadJson("gameData.json")

// function to load the data from JSON to an array, throw errors if there are issues in the process
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename,withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load\(filename):\(error)")
    }
    
   do{
        return try JSONDecoder().decode(T.self, from: data)
   } catch {
        fatalError("Unable to parse\(filename):\(error)")
   }
}
